import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location _location;
  @override
  void initState() {
    _location = Location();
    super.initState();
  }

//  void getWeatherDataByLatLong(Location location) async {
//
//      double temp = jsonDecode(data)['main']['temp'];
//      String cityName = jsonDecode(data)['name'];
//      int weatherCondition = jsonDecode(data)['weather'][0]['id'];
//      print(
//          'temp: $temp\ncityName: $cityName\nweatherCondition: $weatherCondition');
//      print('\n\n');
//      print('status: ${response.statusCode}\nbody: ${response.body}');
//    } else {
//      print('status: ${response.statusCode}\nbody: ${response.body}');
//    }
//  }

  void getLocationData() async {
    await _location.updateCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitude}&appid=$apiKey');
    print('lat: ${_location.latitude}\nlong: ${_location.longitude}');
    var weatherData = await networkHelper.getData(_location);
    double temp = weatherData['main']['temp'];
    String cityName = weatherData['name'];
    int weatherCondition = weatherData['weather'][0]['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
