import 'package:flutter/material.dart';
import 'sideMenuDemo/main.dart';
import 'sliverAppBarDemo/main.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/sidemenudemo': (context) => SideMenuDemo(),
      '/sliverappbardemo': (context) => SliverAppBarDemo(),
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
          ],
        ),
      ),
    );
  }
}
