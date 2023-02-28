import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  final Uri _url = Uri.parse('https://mcbu.edu.tr');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}