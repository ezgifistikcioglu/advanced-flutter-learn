import 'package:flutter/material.dart';
import 'package:flutter_full/mid/service/package_learn_view.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin on State<PackageLearnView> {
  void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
    // if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}
