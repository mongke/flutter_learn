import 'package:flutter/material.dart';

class IoProductCart extends StatelessWidget {
  final Map<String, dynamic> product;
  const IoProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: ListTile(
        
        leading: const Icon(Icons.shopping_bag),
        title: Text(product['title']), // Display product title
        subtitle: Text(product['description']), // Display product description
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Handle product tap
        },
      ),
    );
  }
}
