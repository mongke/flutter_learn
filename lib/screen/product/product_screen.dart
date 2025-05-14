import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:io_app/component/io_product_cart.dart';
import 'package:io_app/theme/io_colors.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<dynamic>? myData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    try {
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      debugPrint('Status code: ${res.statusCode}');
      if (res.statusCode == 200) {
        setState(() {
          myData = json.decode(res.body)['products'];
          isLoading = false;
        });
      } else {
        debugPrint('Error: ${res.statusCode}');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body:
          isLoading
              ? const Center(
                child:
                    CircularProgressIndicator(), // Show a loading indicator while fetching data
              )
              : ListView.builder(
                itemCount:
                    myData?.length ?? 0, // Use the length of the fetched data
                itemBuilder: (context, index) {
                  final product = myData![index];
                  return IoProductCart(product: product);
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getData, // Call _getData when the button is clicked
        backgroundColor:IOColors.primary500, // Replace with IOColors.primary500 if defined
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
