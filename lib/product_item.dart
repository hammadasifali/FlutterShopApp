import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_shop/product_detail.dart';

import 'product_card.dart';
import 'product_data.dart';
import 'search_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late String selectedFilter;

  final List<String> filters = const [
    'All',
    'Addidas',
    'Nike',
    'Bata',
    'Puma',
    'Converse',
    'Reebok',
  ];

  @override
  void initState() {
    super.initState();

    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat', // Use a custom font (you can replace it)
          ),
        ).animate().shake(),
        backgroundColor: Colors.white, // Use a gradient or solid color
        shadowColor: Colors.black45,
        elevation: 8, // Add elevation to the app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/logout');
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? const Color.fromARGB(255, 0, 153, 255)
                            : const Color.fromARGB(255, 202, 228, 255),
                        side: const BorderSide(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        label: Text(
                          filter,
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Customize text color
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        elevation: 5, // Add elevation to the chip
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onDoubleTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      name: product['name'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      company: product['company'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromARGB(216, 0, 110, 184)
                          : const Color.fromARGB(255, 173, 212, 253),
                      shadowColor: Colors.black.withOpacity(0.2),
                      elevation: 5, // Add elevation to the product card
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
