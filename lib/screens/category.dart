import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Map<String, dynamic> categoryListData = {};

  int retunColorInt(String hex) {
    String newInt = hex.replaceFirst('#', '0xff');

    return int.parse(newInt);
  }

  void loadData() async {
    final url = Uri.http('app-interview.easyglue.in', 'middle_repository.json');
    final response = await http.get(url);

    if (response.statusCode >= 400) {
      // show some error

      return;
    }
    final Map<String, dynamic> data = jsonDecode(response.body);

    setState(() {
      categoryListData = data;
    });
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: CircularProgressIndicator(),
    );

    if (categoryListData.isNotEmpty) {
      content = ListView.builder(
          itemCount: categoryListData['shop_by_category'].length,
          itemBuilder: (context, index) {
            final col = retunColorInt(categoryListData['shop_by_category']
                [index]['tint_color'] as String);
            return CustomListTile(
              color: Color(col),

              name:
                  categoryListData['shop_by_category'][index]['name'] as String,
              url: categoryListData['shop_by_category'][index]['image']
                  as String,
            );
          });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Category'),
        leading: const Icon(Icons.arrow_back_ios_new),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.card_travel_outlined,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: content,
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key, required this.color, required this.name, required this.url});

  final Color color;
  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(1), color.withOpacity(0.6)])),
      margin: const EdgeInsets.only(bottom: 1),
      child: Row(
        children: [
          Material(
            elevation: 4, // Adjust elevation for shadow intensity
            shadowColor: Colors.black,
            borderRadius: const BorderRadiusDirectional.only(
              topEnd: Radius.elliptical(30, 80),
              bottomEnd: Radius.elliptical(30, 80),
            ),

            child: Container(
              padding: const EdgeInsets.only(top: 40, bottom: 40, left: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [color.withOpacity(0.4), color.withOpacity(1)]),
                // color: color,
                borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.elliptical(30, 80),
                  bottomEnd: Radius.elliptical(30, 80),
                ),
              ),
              width: 250,
              height: 100,
              child: Text(
                name,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: Container(
           color: Colors.transparent,
              width: 220,
              height: 100,
              child: Image.network(
                url,
                scale: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
