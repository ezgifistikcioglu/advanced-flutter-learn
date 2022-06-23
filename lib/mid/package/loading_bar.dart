import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBar extends StatelessWidget {
  final double? size;
  final double _defaultSize = 40.0;
  const LoadingBar({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitPianoWave(
      color: Colors.white,
      size: size ?? _defaultSize,
    );
  }
}
