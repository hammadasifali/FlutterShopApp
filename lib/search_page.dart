import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        shadowColor: Colors.black45,
        surfaceTintColor: Colors.white,
        actions: [
          Container(
            width: 300,
            height: 50,
            child: const SearchBar(
              leading: Icon(
                Icons.search,
              ),
              hintText: 'Search',
            ),
          ),
          /*
          SizedBox(
            height: 55,
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                prefixIcon: Icon(Icons.search),
                
              ),
            ),
          )*/
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
