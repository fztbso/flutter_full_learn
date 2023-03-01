
import 'dart:io';

import 'package:flutter_full_learn/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);
  final Uri _path = Uri.parse('https://flutter.dev');


  Future<void> toShare(String path) async {
    await launchUrl(_path);
  }
}


class FileDownload implements IFileDownload{
  final Uri _path = Uri.parse('https://flutter.dev');

  @override
  bool? downloadItem(FileItem? fileItem){
    if (fileItem == null) throw FileDownloadException();
    print("a");
    return true;
  }

  @override
  Future<void> toShare(String path) async {
    await launchUrl(_path);
  }
}


class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload {
  void toShowFile();
}