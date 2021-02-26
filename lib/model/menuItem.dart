import 'package:flutter/material.dart';

class MenuItem{
  String name;
  IconData icon;

  MenuItem(_name,_icon){
    name = _name;
    icon= _icon;
  }
}
MenuItem item1 = new MenuItem('item1',Icons.computer);
MenuItem item2 = new MenuItem('item2',Icons.computer);
MenuItem item3 = new MenuItem('item3',Icons.computer);
MenuItem item4 = new MenuItem('item4',Icons.computer);
MenuItem item5 = new MenuItem('item5',Icons.computer);
MenuItem item6 = new MenuItem('item6',Icons.computer);
MenuItem item7 = new MenuItem('item7',Icons.computer);
MenuItem item8 = new MenuItem('item8',Icons.computer);
List<MenuItem> itemsList = new List<MenuItem>();
