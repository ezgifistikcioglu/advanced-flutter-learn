import 'package:flutter/material.dart';
import 'package:flutter_full/basic/icon_learn.dart';
import 'package:flutter_full/basic/image_learn.dart';
import 'package:flutter_full/basic/text_view_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.6);
  int _currentPageIndex = 0;

  void _updatePageIndex(int index) {
    setState(() => _currentPageIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        //mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(),
          FloatingActionButton(
              child: const Icon(Icons.chevron_left),
              onPressed: () {
                _pageController.previousPage(
                    duration: DurationUtility.durationLow,
                    curve: Curves.slowMiddle);
              }),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: FloatingActionButton(
                child: const Icon(Icons.chevron_right),
                onPressed: () {
                  _pageController.nextPage(
                      duration: DurationUtility.durationLow,
                      curve: Curves.slowMiddle);
                }),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: true,
        onPageChanged: _updatePageIndex,
        controller: _pageController,
        children: [const ImageLearn(), IconLearnView(), TextViewLearn()],
      ),
    );
  }
}

class DurationUtility {
  static const durationLow = Duration(seconds: 1);
}
