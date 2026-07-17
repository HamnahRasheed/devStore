import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uibasic/Model/store_model.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [];
  String selectedCategory = 'All';

  List<StoreModel> storelist = [];
  Future<List<StoreModel>> getstoreapi() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      storelist.clear();
      for (Map i in data) {
        storelist.add(StoreModel.fromJson(i));
        categories = ['All'];
        for (var product in storelist) {
          if (!categories.contains(product.category)) {
            categories.add(product.category!);
          }
        }
      }
      return storelist;
    } else {
      return storelist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Text(
                'Dev',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter-Bold',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Store',
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: 'Inter-Bold',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xff121212),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Products...',
                hintStyle: TextStyle(
                  fontFamily: 'Inter-Light',
                  fontSize: 18,
                  color: Colors.grey,
                ),

                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Color(0xff1e1e1e),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            //categories
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20,
              ),
              child: Text('Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter-Bold',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, pos) {
                  bool selected = categories[pos] == selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[pos];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: selected ? Colors.green : Color(0xff1E1E1E),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            categories[pos],
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Inter-Light',
                            ),),
                        ),),
                    ),);
                },),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                future: getstoreapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loading...');
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 18,
                            childAspectRatio: .70,
                          ),
                      itemCount: storelist.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Color(0xff1E1E1E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Image.network(
                                      snapshot.data![index].image.toString(),
                                    ),),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,),
                                  child: Text(
                                    snapshot.data![index].title.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter-Bold',
                                      color: Colors.white,
                                    ),),
                                ),
                                SizedBox(height: 5),
                                //ratings
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star,
                                        color: Colors.amber, size: 20.0,),
                                      SizedBox(width: 5),
                                      Text(
                                        snapshot.data![index].rating!.rate
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Inter-Light',
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text('(' +
                                          snapshot.data![index].rating!.count
                                              .toString() + ')',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Inter-Light',
                                          color: Colors.white,
                                        ),),
                                    ],),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 5),
                                      Text(
                                        r'$' +
                                            snapshot.data![index].price
                                                .toString(),
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter-Bold',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    fixedSize: Size(300, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_bag_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Add To Cart',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Inter-Bold',
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ],),),
                        );},
                    );}
                },),
            ),
          ],),
      ),);
  }
}