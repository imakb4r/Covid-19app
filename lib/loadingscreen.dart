import 'package:covid_19/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'networking.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getCovidData();
  }

  getCovidData() async {

    NetworkHelper networkHelper = NetworkHelper('https://api.covid19api'
        '.com/summary');
    var apiData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        covidData: apiData,
      );
    }));
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
