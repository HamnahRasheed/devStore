import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String _userName = '';
  String _userEmail = '';
  String _errorMessage = '';

  // Getters
  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;
  String get userEmail => _userEmail;
  String get errorMessage => _errorMessage;

  // Initialize and check auto-login session on app start
  Future<void> checkAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _userEmail = prefs.getString('userEmail') ?? '';
    _userName = prefs.getString('userName') ?? '';
    notifyListeners();
  }

  // SIGNUP: Save user account credentials to local database (SharedPreferences)
  Future<bool> signup({
    required String name,
    required String email,
    required String contact,
    required String password,
  }) async {
    if (name.trim().isEmpty || email.trim().isEmpty || password.trim().isEmpty) {
      _errorMessage = 'Please fill in all required fields.';
      notifyListeners();
      return false;
    }

    if (!email.contains('@')) {
      _errorMessage = 'Please enter a valid email address.';
      notifyListeners();
      return false;
    }

    if (password.length < 6) {
      _errorMessage = 'Password must be at least 6 characters.';
      notifyListeners();
      return false;
    }

    final prefs = await SharedPreferences.getInstance();

    // Get existing accounts database map
    String? accountsJson = prefs.getString('user_accounts_db');
    Map<String, dynamic> accounts = accountsJson != null ? jsonDecode(accountsJson) : {};

    // Check if account already exists
    if (accounts.containsKey(email.trim().toLowerCase())) {
      _errorMessage = 'An account with this email already exists! Please Log In.';
      notifyListeners();
      return false;
    }

    // Save new account
    accounts[email.trim().toLowerCase()] = {
      'name': name.trim(),
      'password': password.trim(),
      'contact': contact.trim(),
    };

    await prefs.setString('user_accounts_db', jsonEncode(accounts));

    // Save active logged-in session
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userEmail', email.trim());
    await prefs.setString('userName', name.trim());

    _isLoggedIn = true;
    _userEmail = email.trim();
    _userName = name.trim();
    _errorMessage = '';
    notifyListeners();
    return true;
  }

  // LOGIN: Verify credentials against registered accounts
  Future<bool> login(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      _errorMessage = 'Please enter both email and password.';
      notifyListeners();
      return false;
    }

    final prefs = await SharedPreferences.getInstance();
    String? accountsJson = prefs.getString('user_accounts_db');
    Map<String, dynamic> accounts = accountsJson != null ? jsonDecode(accountsJson) : {};

    final cleanEmail = email.trim().toLowerCase();

    // Built-in Demo Account Fallback (For instant testing)
    if (cleanEmail == 'demo@devstore.com' && password == '123456') {
      await _saveSession(prefs, cleanEmail, 'Demo User');
      return true;
    }

    // VERIFICATION STEP 1: Check if email exists in database
    if (!accounts.containsKey(cleanEmail)) {
      _errorMessage = 'No account found with this email. Please sign up first!';
      notifyListeners();
      return false;
    }

    // VERIFICATION STEP 2: Check if password matches
    final userAccount = accounts[cleanEmail];
    if (userAccount['password'] != password.trim()) {
      _errorMessage = 'Incorrect password. Please try again.';
      notifyListeners();
      return false;
    }

    // Credentials Verified! Save active session
    await _saveSession(prefs, cleanEmail, userAccount['name']);
    return true;
  }

  // Helper method to save active session
  Future<void> _saveSession(SharedPreferences prefs, String email, String name) async {
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userEmail', email);
    await prefs.setString('userName', name);

    _isLoggedIn = true;
    _userEmail = email;
    _userName = name;
    _errorMessage = '';
    notifyListeners();
  }

  // LOGOUT: Clear active session
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    _isLoggedIn = false;
    _userEmail = '';
    _userName = '';
    _errorMessage = '';
    notifyListeners();
  }
}