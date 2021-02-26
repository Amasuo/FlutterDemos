import 'package:flutter/material.dart';
import 'package:test_ui/model/product.dart';

Widget Content1(){
  return Padding(
    padding: new EdgeInsets.all(7),
    child:
    ListView(
      children: [
        Padding(
          padding: new EdgeInsets.fromLTRB(0, 5, 0, 20),
          child:
          Text(
            'Your Favourites',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child:
              Wrap(
                direction: Axis.horizontal,
                children: [
                  for (Product p in productsList)
                  Padding(
                    padding: new EdgeInsets.fromLTRB(0, 0, 10, 20),
                    child:
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          alignment: Alignment.center,
                          child: Image.asset(p.image),
                        ),
                        Text(p.name),
                      ],
                    ),
                  ),
                ],
              ),
        ),
        Divider(
          color: Colors.grey,
        ),
        Padding(
          padding: new EdgeInsets.fromLTRB(0, 5, 0, 20),
          child:
          Text(
            'Special Events',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child:
              Wrap(
                direction: Axis.horizontal,
                children: [
                  for (int i=0; i<3 ; i++)
                  Padding(
                    padding: new EdgeInsets.fromLTRB(0, 0, 10, 20),
                    child:
                    Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/event.png'),
                        ),
                        Text('Event1'),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ],
    ),
  );
}