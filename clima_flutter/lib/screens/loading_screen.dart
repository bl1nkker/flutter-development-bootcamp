import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const API_KEY = '7d1666e631b0987960986abde6965cc0';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric');
    var weatherData = await networkHelper.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  weatherData: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
