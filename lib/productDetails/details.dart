import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: new EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child:Row(
                        children: [
                          Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: Icon(Icons.phone),
                          ),
                          Text('99 888 777')
                        ],
                      ),
                    ),
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child:Row(
                        children: [
                          Padding(
                            padding: new EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: Icon(Icons.location_on),
                          ),
                          Text('Test, 44, 00185 TT')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: new EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child:Row(
                    children: [
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(Icons.access_time),
                      ),
                      Text('Business hours: 11:00-21:30')
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: new EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: new EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child:Row(
                    children: [
                      Padding(
                        padding: new EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Icon(Icons.local_shipping_outlined),
                      ),
                      Text('The shipping service: ServiceX')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
