import 'package:flutter/material.dart';
import 'package:flutter_tiktok/screen/pages/add_video_page.dart';
import 'package:flutter_tiktok/screen/pages/discover_page.dart';
import 'package:flutter_tiktok/screen/pages/home_page.dart';
import 'package:flutter_tiktok/screen/pages/inbox_page.dart';
import 'package:flutter_tiktok/screen/pages/me_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageController = 0;
  List<Widget> _pages = [
    HomePage(),
    DicoverPage(),
    AddVideoPage(),
    InboxPage(),
    MePage()
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: Colors.black,
            height: sizingInformation.localWidgetSize.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        _pageController = 0;
                      });
                    },
                    child: _navBarItem(title: "首页", icon: Icons.home)),
                InkWell(
                    onTap: () {
                      setState(() {
                        _pageController = 1;
                      });
                    },
                    child: _navBarItem(title: "发现", icon: Icons.search)),
                InkWell(
                  onTap: () {
                    setState(() {
                      _pageController = 2;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: sizingInformation.localWidgetSize.height * 0.07,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 20,
                            height:
                                sizingInformation.localWidgetSize.height * 0.04,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 20,
                            height:
                                sizingInformation.localWidgetSize.height * 0.04,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 40,
                            height:
                                sizingInformation.localWidgetSize.height * 0.04,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        _pageController = 3;
                      });
                    },
                    child: _navBarItem(title: "消息", icon: Icons.message)),
                InkWell(
                    onTap: () {
                      setState(() {
                        _pageController = 4;
                      });
                    },
                    child: _navBarItem(title: "我的", icon: Icons.person))
              ],
            ),
          ),
          body: _pages[_pageController],
        );
      },
    );

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Home Screen'),
            )
          ],
        ),
      ),
    );
  }

  Widget _navBarItem({String title, IconData icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon), Text(title)],
    );
  }
}
