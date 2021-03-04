import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_ui/productDetails/details.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart' as extended;
import 'package:customizable_space_bar/customizable_space_bar.dart';

class ProductDetailsDemo extends StatefulWidget {
  @override
  _ProductDetailsDemoState createState() => _ProductDetailsDemoState();
}

enum MenuOption{item1, item2, item3}

class _ProductDetailsDemoState extends State<ProductDetailsDemo> with TickerProviderStateMixin{
  ScrollController _scrollController;
  bool _scrolling ;
  TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
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
        _scrollController.offset > (70);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        extended.NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return [
              SliverAppBar(
                actions: [
                  if(!_scrolling)
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
                  if (_scrolling)
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){

                    },
                  ),
                  if (_scrolling)
                  IconButton(
                      icon: Icon(Icons.share_outlined),
                      onPressed: (){

                      }
                  ),
                  if (_scrolling)
                  IconButton(
                      icon: Icon(Icons.star_border_outlined),
                      onPressed: (){

                      }
                  ),
                ],
                expandedHeight: 150,
                pinned: true,
                  iconTheme: IconThemeData(
                    color: Colors.white, //change your color here
                  ),
                  backgroundColor: Colors.white,
                flexibleSpace: CustomizableSpaceBar(
                  builder: (context, scrollingRate){
                   return Stack(
                     children: [
                       ImageFiltered(
                         imageFilter: ImageFilter.blur(sigmaX: 40),
                         child: Container(
                           decoration: new BoxDecoration(
                             image: new DecorationImage(
                               image: new AssetImage('assets/images/store.png'),
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),
                       ),
                       _scrolling? Align(
                             alignment: FractionalOffset.bottomLeft,
                             child: Container(
                               width: 130,
                               height: 100,
                               child: Padding(
                                 child: Image.asset('assets/images/store.png',fit: BoxFit.cover),
                                 padding: EdgeInsets.only(left: 20.0),
                               ),
                             ),
                       ): Container(),
                       _scrolling?Positioned(
                         bottom: 30,
                         left: 150,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Padding(
                               padding: EdgeInsets.only(bottom: 5),
                               child: Text('Title',style: TextStyle(color: Colors.white),),
                             ),
                             Padding(
                               padding: EdgeInsets.only(bottom: 5),
                               child: Text('tags',style: TextStyle(color: Colors.grey),),
                             ),
                             Padding(
                               padding: EdgeInsets.only(bottom: 5),
                               child: Text('description',style: TextStyle(color: Colors.white),),
                             ),
                           ],
                         ),
                       ): Align(
                         child: Text('Title',style: TextStyle(color: Colors.white),),
                         alignment: Alignment.center,
                       ),
                     ],
                   );
                  },
                )
              ),
            ];
          },
          body:
            Column(
              children: [
                PreferredSize(
                  child: Card(
                    elevation: 0.0,
                    margin: new EdgeInsets.all(0.0),
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      onTap: (index){
                        setState(() {
                          _tabIndex = index;
                        });
                      },
                      labelColor: Colors.grey,
                      indicatorColor: Colors.cyan,
                      tabs: [
                        Tab(
                          text: 'GOODS',
                        ),
                        Tab(
                          text: "EVALUATION",
                        ),
                        Tab(
                          text: "DETAILS",
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: IndexedStack(
                    index: _tabIndex,
                    children: [
                      Container(),
                      Container(),
                      extended.NestedScrollViewInnerScrollPositionKeyWidget(
                      Key(
                        'Tab0'
                      ),
                      EasyRefresh(
                        child: Details(),
                        onRefresh: () async {
                          await Future.delayed(Duration(seconds: 2), () {
                            if(mounted) {
                              setState(() {

                              });
                            }
                          }
                          );
                        },
                      ),
                    ),
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}
