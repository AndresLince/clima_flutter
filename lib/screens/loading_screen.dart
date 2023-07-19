import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/location.dart';
import 'package:http/http.dart' as http;

const apiKey = 'bef2c0dc64e4e34e1fe7362293461a13';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String location = '';
  double temperature = 0;
  String cityName = '';
  int conditionNumber = 0;
  getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  getData() async {
    try{
      final uri = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=100&lon=100&appid=$apiKey');
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        String data = response.body;
        temperature = jsonDecode(data)['main']['temp'];
        cityName = jsonDecode(data)['name'];
        conditionNumber = jsonDecode(data)['weather'][0]['id'];
        print(temperature);
        print(cityName);
        print(conditionNumber);
      } else {
        print(response.statusCode);
      }
    }catch(ex) {
      print(ex);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(location),
      ),
    );
  }
}
