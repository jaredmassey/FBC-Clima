import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future<dynamic> getData(Location location) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('status: ${response.statusCode}\nbody: ${response.body}');
    }
  }
}
