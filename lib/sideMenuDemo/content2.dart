import 'package:flutter/material.dart';

import '../model/product.dart';

Widget Content2(){
  return Padding(
      padding: new EdgeInsets.all(7),
      child:
      ListView(
        children: [
          ExpansionTile(
              title: Text('Your Favourites'),
              children: [
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
            ],
          ),
          ExpansionTile(
            title: Text('Special Events'),
            children: [
              Wrap(
                direction: Axis.horizontal,
                children: [
                  for (int i=0; i<3; i++)
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
            ],
          ),
        ],
      ),
  );
}