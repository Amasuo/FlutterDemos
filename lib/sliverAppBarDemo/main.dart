import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  @override
  _SliverAppBarDemoState createState() => _SliverAppBarDemoState();
}

enum MenuOption{item1, item2, item3}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  ScrollController _scrollController;
  bool _scrolling ;

  @override
  void initState() {
    super.initState();
    _scrolling = true;
    _scrollController = ScrollController()
      ..addListener(
            () => _isAppBarExpanded ?
        _scrolling != false ?
        setState(
              () {
            _scrolling = false;
            print(
                'setState is called');
          },
        ):{}
            : _scrolling != true?
        setState((){
          print(
              'setState is called');
          _scrolling = true;
        }):{},

      );
  }
  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (180 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          controller: _scrollController,
          slivers:<Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 200,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage('assets/images/tablet.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            iconSize: 40,
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          )
                      )
                    ],
                  )
                ),
              ),
              title: !_scrolling? ClipOval(
                clipper: MyClipper(),
                child: Align(
                  alignment: Alignment.center,
                  heightFactor: 0.5,
                  child: Image.asset('assets/images/tablet.png'),
                ),
              ):null ,
              actions: [
                PopupMenuButton(
                    itemBuilder: (BuildContext context){
                      return <PopupMenuEntry<MenuOption>>[
                        PopupMenuItem(
                          child: Text('item1'),
                          value: MenuOption.item1,
                        ),
                        PopupMenuItem(
                          child: Text('item2'),
                          value: MenuOption.item2,
                        ),
                        PopupMenuItem(
                          child: Text('item3'),
                          value: MenuOption.item3,
                        ),
                      ];
                    }
                ),
              ],

            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                    alignment: Alignment.topLeft,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text('Titre',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: new EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '),
                        ),
                      ],
                    ),
                    padding: new EdgeInsets.fromLTRB(10, 20, 0, 20),
                  );
                },
                childCount: 5
              ),
            ),
          ]
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    //return Rect.fromCircle(center: Offset(200, 100), radius: 150);
    return Rect.fromLTWH(size.width/2.5, 5, 50, 50);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}