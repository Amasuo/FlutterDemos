import 'package:flutter/material.dart';
import 'package:test_ui/model/product.dart';
import 'content1.dart';
import 'content2.dart';
import '../model/menuItem.dart';


List colorList=[Colors.white,Colors.grey[200],Colors.grey[200],Colors.grey[200],Colors.grey[200],Colors.grey[200],Colors.grey[200],Colors.grey[200]];
List selectedList = [true,false,false,false,false,false,false,false];


class SideMenuDemo extends StatefulWidget {
  @override
  _SideMenuDemoState createState() => _SideMenuDemoState();
}

class _SideMenuDemoState extends State<SideMenuDemo> {
  Widget content;
  @override
  void initState() {
    itemsList.add(item1);
    itemsList.add(item2);
    itemsList.add(item3);
    itemsList.add(item4);
    itemsList.add(item5);
    itemsList.add(item6);
    itemsList.add(item7);
    itemsList.add(item8);

    productsList.add(p1);
    productsList.add(p2);
    productsList.add(p3);

    content = Content1();
  }

  void changeContent(int i){
    switch(i+1){
      case 1 : {
        setState(() {
          content = Content1();
          for (int j=0; j<8 ; j++){
            colorList[j]=Colors.grey[200];
            selectedList[j] = false;
          }
          colorList[i]=Colors.white;
          selectedList[i] = true;
        });
      }
      break;

      case 2 : {
        setState(() {
          content = Content2();
          for (int j=0; j<8 ; j++){
            colorList[j]=Colors.grey[200];
            selectedList[j] = false;
          }
          colorList[i]=Colors.white;
          selectedList[i] = true;
        });
      }
      break;

      case 3 : {
        setState(() {
          content = Content1();
          for (int j=0; j<8 ; j++){
            colorList[j]=Colors.grey[200];
            selectedList[j] = false;
          }
          colorList[i]=Colors.white;
          selectedList[i] = true;
        });
      }
      break;

      case 4 : {
        setState(() {
          content = Content1();
          for (int j=0; j<8 ; j++){
            colorList[j]=Colors.grey[200];
            selectedList[j] = false;
          }
          colorList[i]=Colors.white;
          selectedList[i] = true;
        });
      }
      break;

      case 5 : {
        setState(() {
          content = Content1();
          for (int j=0; j<8 ; j++){
            colorList[j]=Colors.grey[200];
            selectedList[j] = false;
          }
          colorList[i]=Colors.white;
          selectedList[i] = true;
        });
      }
      break;

      case 6 : {
        setState(() {
          content = Content1();
          for (int j=0; j<8 ; j++){
            colorList[j]=Colors.grey[200];
            selectedList[j] = false;
          }
          colorList[i]=Colors.white;
          selectedList[i] = true;
        });
      }
      break;

      case 7 : {
        setState(() {
          content = Content1();
          for (int j=0; j<8 ; j++){
            colorList[j]=Colors.grey[200];
            selectedList[j] = false;
          }
          colorList[i]=Colors.white;
          selectedList[i] = true;
        });
      }
      break;

      case 8 : {
        setState(() {
          content = Content1();
          for (int j=0; j<8 ; j++){
            colorList[j]=Colors.grey[200];
            selectedList[j] = false;
          }
          colorList[i]=Colors.white;
          selectedList[i] = true;
        });
      }
      break;
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestUI',
      home: Scaffold(
        // appBar: AppBar(title: Text('TestUI')),
        body:
        Row(
          children: [
            ConstrainedBox(
              constraints: new BoxConstraints(
                  maxWidth: 80.0
              ),
              child:
              ListView(
                shrinkWrap: true,
                children: [
                  for(int i=0; i <itemsList.length; i++ )
                    Container(
                      decoration: BoxDecoration(
                          color: colorList[i]
                      ),
                      child:
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            changeContent(i);
                          }
                          );
                        },
                        child:
                        Center(
                          child:
                          Column(
                            mainAxisAlignment:MainAxisAlignment.center ,
                            children: [
                              Icon(itemsList[i].icon),
                              ListTile(
                                title: Text(itemsList[i].name),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
                child:
                content
            ),
          ],
        ),
      ),
    );
  }
}
