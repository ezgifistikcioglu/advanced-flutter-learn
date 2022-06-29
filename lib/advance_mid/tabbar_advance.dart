import 'package:flutter/material.dart';
import 'package:flutter_full/advance_mid/feed_view.dart';

import '../basic/card_learn.dart';
import '../basic/image_learn.dart';
import '../basic/list_view_learn.dart';
import '../basic/page_view_learn.dart';

class TabbarAdvanceLearn extends StatefulWidget {
  const TabbarAdvanceLearn({Key? key}) : super(key: key);

  @override
  State<TabbarAdvanceLearn> createState() => _TabbarAdvanceLearnState();
}

class _TabbarAdvanceLearnState extends State<TabbarAdvanceLearn>
    with TickerProviderStateMixin {
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
        ),
        appBar: AppBar(),
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
          FeedView(),
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
