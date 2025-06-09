import 'package:flutter/material.dart';

void main() {
  runApp(MyShopApp());
}

class MyShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;
  Product({required this.name, required this.price, required this.imageUrl});
}

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> products = [
    Product(
      name: 'T-Shirt',
      price: 19.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Jeans',
      price: 39.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Sneakers',
      price: 59.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      name: 'Cap',
      price: 9.99,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];
  List<Product> cart = [];
  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Cart: ${cart.length}')),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(product.imageUrl, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('\$${product.price.toStringAsFixed(2)}'),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => addToCart(product),
                        child: Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
