import 'package:flutter/material.dart';
import 'package:test_ui/productDetails/main.dart';
import 'sideMenuDemo/main.dart';
import 'sliverAppBarDemo/main.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/sidemenudemo': (context) => SideMenuDemo(),
      '/sliverappbardemo': (context) => SliverAppBarDemo(),
      '/productdetailsdemo': (context) => ProductDetailsDemo(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('SideMenu Demo'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/sidemenudemo');
              },
            ),
            ElevatedButton(
              child: Text('SliverAppBar Demo'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/sliverappbardemo');
              },
            ),
            ElevatedButton(
              child: Text('ProductDetails Demo'),
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/productdetailsdemo');
              },
            ),
          ],
        ),
      ),
    );
  }
}
