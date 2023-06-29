import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class SalmdroidNWNet {
  static const String officialUrl =
      'https://play.google.com/store/apps/details?id=com.aoi2blue.salmdroid.nw';
  static const String testVerUrl =
      'https://play.google.com/store/apps/details?id=com.aoi2blue.salmdroid.nw.test';

  static http.Client _getClient() {
    HttpClient clientBase = HttpClient();
    clientBase.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    return IOClient(clientBase);
  }

  static Future<String> _getAppVersion(Uri url) async {
    var client = _getClient();
    http.Response response = (await client.get(url));

    RegExp pattern = RegExp(r'\[\[\[\"\d+.\d+.\d+\"\]\]');
    var matches = pattern.firstMatch(response.body);
    if (matches != null) {
      debugPrint('version matches: ${matches[0]}');
      int len = matches[0].toString().length;
      return matches[0].toString().substring(4, len - 3);
    }
    return '';
  }

  static Future<String> getOfficialVersion() async {
    Uri url = Uri.parse(officialUrl);
    return _getAppVersion(url);
  }

  static Future<String> getTestVerVersion() async {
    Uri url = Uri.parse(testVerUrl);
    return _getAppVersion(url);
  }
}
