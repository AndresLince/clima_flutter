import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  String location = '';
  getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  getData() async {
    try{
      final uri = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=100&lon=100&appid=bef2c0dc64e4e34e1fe7362293461a13');
      Response response = await get(uri);
      print(response);
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
