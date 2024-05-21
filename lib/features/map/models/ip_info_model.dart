import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class IpInfoModel extends Equatable {
  final String status;
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double lat;
  final double lon;
  final String timezone;
  final String isp;
  final String org;
  final String as;
  final String ipAddress;

  const IpInfoModel({
    required this.status,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.as,
    required this.ipAddress,
  });

  @override
  List<Object> get props => [
        status,
        country,
        countryCode,
        region,
        regionName,
        city,
        zip,
        lat,
        lon,
        timezone,
        isp,
        org,
        as,
        ipAddress,
      ];

  factory IpInfoModel.fromJson(Map<String, dynamic> json) {
    return IpInfoModel(
      status: json['status'],
      country: json['country'],
      countryCode: json['countryCode'],
      region: json['region'],
      regionName: json['regionName'],
      city: json['city'],
      zip: json['zip'],
      lat: json['lat'],
      lon: json['lon'],
      timezone: json['timezone'],
      isp: json['isp'],
      org: json['org'],
      as: json['as'],
      ipAddress: json['query'],
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'country': country,
        'countryCode': countryCode,
        'region': region,
        'regionName': regionName,
        'city': city,
        'zip': zip,
        'lat': lat,
        'lon': lon,
        'timezone': timezone,
        'isp': isp,
        'org': org,
        'as': as,
        'query': ipAddress,
      };
}

class IpInfoRepository {
  static Future<String> getCurrentIp() async {
    final response =
        await http.get(Uri.parse('https://api.ipify.org?format=json'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['ip'];
    } else {
      throw Exception('Failed to get IP');
    }
  }

  static Future<IpInfoModel> getIpInfo(String ip) async {
    final response = await http.get(Uri.parse('http://ip-api.com/json/$ip'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      IpInfoModel ipInfo = IpInfoModel.fromJson(data);
      return ipInfo;
    } else {
      throw Exception('Failed to get IP info');
    }
  }
}
