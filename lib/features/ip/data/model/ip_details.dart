class IPDetailsModel {
  late String country;
  late String countryCode;
  late String region;
  late String regionName;
  late String city;
  late String zip;
  late String lat;
  late String lon;
  late String timezone;
  late String isp;
  late String org;
  late String as;
  late String query;

  IPDetailsModel({
    this.country = '',
    this.countryCode = '',
    this.region = '',
    this.regionName = '',
    this.city = '',
    this.zip = ' --- ',
    this.lat = '',
    this.lon = '',
    this.timezone = 'Unknown',
    this.isp = ' --- ',
    this.org = '',
    this.as = '',
    this.query = 'Not available',
  });

  IPDetailsModel.fromJson(Map<String, dynamic> json) {
    country = json['country'].toString();
    countryCode = json['countryCode'].toString();
    region = json['region'].toString();
    regionName = json['regionName'].toString();
    city = json['city'].toString();
    zip = json['zip'].toString();
    lat = json['lat'].toString();
    lon = json['lon'].toString();
    timezone = json['timezone'].toString();
    isp = json['isp'].toString();
    org = json['org'].toString();
    as = json['as'].toString();
    query = json['query'].toString();
  }
}
