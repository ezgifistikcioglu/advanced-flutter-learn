import 'package:flutter/material.dart';

const double kZero = 0;

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({Key? key}) : super(key: key);

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: _DurationItems._durationLow);
  }

  bool _isVisible = false;
  bool _isOpacity = false;

  late AnimationController animationController;

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
        floatingActionButton: FloatingActionButton(onPressed: (() {
          _changeVisible();
          animationController.animateTo(_isVisible ? 1 : 0);
        })),
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
                  icon: Icon(_isOpacity
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_rounded)),
            ),
            AnimatedDefaultTextStyle(
                child: const Text('data'),
                style: (_isVisible
                        ? context.textTheme().headline1
                        : context.textTheme().subtitle1) ??
                    const TextStyle(),
                duration: _DurationItems._durationLow),
            AnimatedIcon(
              icon: AnimatedIcons.list_view,
              progress: animationController,
            ),
            AnimatedContainer(
                duration: _DurationItems._durationLow,
                color: Colors.purple,
                margin: const EdgeInsets.all(20),
                height: _isVisible
                    ? kZero
                    : MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.height * 0.2),
            Expanded(
                child: Stack(
              children: const [
                AnimatedPositioned(
                    top: 30,
                    curve: Curves.elasticOut,
                    child: Text('data'),
                    duration: _DurationItems._durationLow)
              ],
            )),
            Expanded(
              child: AnimatedList(
                primary: true,
                itemBuilder: (context, index, animation) {
                  return const Text('hi');
                },
              ),
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
