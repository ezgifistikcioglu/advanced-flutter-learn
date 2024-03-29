import 'package:flutter/material.dart';
import 'package:flutter_full/basic/card_learn.dart';
import 'package:flutter_full/basic/image_learn.dart';
import 'package:flutter_full/basic/list_view_learn.dart';
import 'package:flutter_full/basic/page_view_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(onPressed: () {
          _tabController.animateTo(_MyTabViews.home.index);
        }),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedValue,
          //shape: const CircularNotchedRectangle(),
          child: _myTabView(),
          // [
          //Tab(child: Text('Page1')),
          // Tab(child: Text('Page2')),
          //],
        ),
        appBar: AppBar(
            //bottom: const TabBar(  tabs: [Tab(child: Text('Page1')),Tab(child: Text('Page2'))],),
            ),
        body: _tabBarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        indicatorColor: Colors.white,
        //labelColor: Colors.amber,
        //unselectedLabelColor: Colors.white,
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        //isScrollable: true,
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabBarView() {
    return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          CardLearn(),
          PageViewLearn(),
          ImageLearn(),
          ListViewLearn()
        ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {
  // void name(args) {}
}
