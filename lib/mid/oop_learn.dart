import 'dart:io';

import 'package:flutter_full/mid/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  void toShare(Uri path) async {
    await launchUrl(path);
  }
}

///  with ShareMixin alamayız çünkü ben IFileDownload'ın birebir aynısını implement ettim zaten diyor bize.
class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadException();
    }
    print('file item is not null');
    return true;
  }

  @override
  void toShare(Uri path) {}
}

class FileDownload2 extends IFileDownload with ShareMixin {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadException();
    }
    print('file item is not null');
    return true;
  }

  @override
  void bisiler() {
    // TODO: implement bisiler
  }

  /// Zorunlu değil.
  //@override
  //void toShare(Uri path) {}
}

class SmsDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) {
      throw FileDownloadException();
    }
    print('file item is not null');
    return true;
  }

  @override
  void toShare(Uri path) async {
    await launchUrl(Uri.parse("sms:$path"));
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

class Name {}

mixin ShareMixin on IFileDownload {
  void bisiler();
  void toShowFile() {}
}
