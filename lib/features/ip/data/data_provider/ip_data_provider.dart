import 'dart:developer';

import 'package:http/http.dart';

class IpDataProvider {
  //
  Future<String?> getIPDetailsResponse() async {
    try {
      final res = await get(Uri.parse('http://ip-api.com/json'));
      return res.body;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
