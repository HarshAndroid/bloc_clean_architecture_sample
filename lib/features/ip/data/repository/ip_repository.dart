import 'dart:convert';
import 'dart:developer';

import '../data_provider/ip_data_provider.dart';
import '../model/ip_details.dart';

class IpRepository {
  //
  Future<IPDetailsModel?> getIPDetails() async {
    try {
      final res = await IpDataProvider().getIPDetailsResponse();

      if (res == null) return null;

      return IPDetailsModel.fromJson(jsonDecode(res));
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
