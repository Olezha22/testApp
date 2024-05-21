import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/features/map/models/ip_info_model.dart';

class RememberIpInfoPrefs {
  
  static Future<void> storeUserInfo(IpInfoModel ipInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(ipInfo.toJson());
    await preferences.setString("currentIp", userJsonData);
  }

  static Future<IpInfoModel?> readUserInfo() async {
    IpInfoModel? currentIpInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? ipInfo = preferences.getString("currentIp");
    if (ipInfo != null) {
      Map<String, dynamic> userDataMap = jsonDecode(ipInfo);
      currentIpInfo = IpInfoModel.fromJson(userDataMap);
    }
    return currentIpInfo;
  }
}
