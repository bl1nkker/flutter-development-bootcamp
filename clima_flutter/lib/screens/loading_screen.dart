import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=7d1666e631b0987960986abde6965cc0'));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Error');
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
