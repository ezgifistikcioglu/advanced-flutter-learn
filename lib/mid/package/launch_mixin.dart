import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../package_learn_view.dart';

mixin LaunchMixin on State<PackageLearnView> {
  void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
    // if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}

//mixin LaunchMixinForShared on State<UserListView> {
//  void launchURL(Uri url) async {
//    if (await canLaunchUrl(url)) {
//      await launchUrl(url);
//    }
//    // if (!await launchUrl(url)) throw 'Could not launch $url';
//  }
//}
