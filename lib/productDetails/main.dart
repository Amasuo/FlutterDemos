import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_ui/productDetails/details.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
as extended;


class ProductDetailsDemo extends StatefulWidget {
  @override
  _ProductDetailsDemoState createState() => _ProductDetailsDemoState();
}

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
                expandedHeight: 150,
                pinned: true,
                floating: true,
                backgroundColor: Colors.white,
                title: !_scrolling?
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 40),
                      child: Image.asset('assets/images/store.png',fit: BoxFit.cover),
                    )
                    :null ,
                flexibleSpace: FlexibleSpaceBar(
                  title: _scrolling? Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          child: Image.asset('assets/images/store.png',fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                          child: Text('Title'),
                        )
                      ],
                    ),
                  ):null ,
                  background: ImageFiltered(
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
                ),
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
