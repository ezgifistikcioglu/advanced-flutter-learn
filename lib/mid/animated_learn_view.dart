import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> {
  bool _isVisible = false;
  bool _isOpacity = false;

  void _changeVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeOpacity() {
    setState(() {
      _isOpacity = !_isOpacity;
    });
  }

  /// body içinde tek tek yapılanlar:
  /// * Text('data', style: context.textTheme().subtitle1)
  /// * _isVisible ? Placeholder() : null
  /// Not: AnimatedCrossFade : 2 tane view arasında değişiklik yapmayı sağlar
  /// * _placeHolderWithAnimatedCrossFade()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: _placeHolderWithAnimatedCrossFade()),
        floatingActionButton:
            FloatingActionButton(onPressed: (() => _changeVisible())),
        body: Column(
          children: [
            ListTile(
              title: AnimatedOpacity(
                  duration: _DurationItems._durationLow,
                  opacity: _isOpacity ? 1 : 0,
                  child: const Text('data')),
              trailing: IconButton(
                  onPressed: () {
                    _changeOpacity();
                  },
                  icon: const Icon(Icons.precision_manufacturing_rounded)),
            )
          ],
        ));
  }

  AnimatedCrossFade _placeHolderWithAnimatedCrossFade() {
    return AnimatedCrossFade(
      firstChild: const Placeholder(),
      secondChild: const SizedBox.shrink(),
      duration: _DurationItems._durationLow,
      crossFadeState:
          _isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

extension BuildContextExtension on BuildContext {
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class _DurationItems {
  static const Duration _durationLow = Duration(seconds: 1);
}
