import 'dart:convert';

import 'package:covid_19/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/counter.dart';
import 'widgets/my_header.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you Need",
              textBottom: "is stay at Home.",
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0xFFE5E5E5),
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/maps-and-flags.svg",
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        value: "India",
                        items: [
                          'India',
                          'Bangladesh',
                          'United States',
                          'Pakistan'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Cases Update\n",
                          style: kTitleTextstyle,
                        ),
                        TextSpan(
                          text: "Newest update April 7",
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See Details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    color: kShadowColor,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Counter(
                    color: kInfectedColor,
                    title: "Infected",
                    number: 1046,
                  ),
                  Counter(
                    color: kDeathColor,
                    title: "Deaths",
                    number: 58431,
                  ),
                  Counter(
                    color: kRecovercolor,
                    title: "Recovered",
                    number: 46,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spread of Virus",
                    style: kTitleTextstyle,
                  ),
                  Text(
                    "See Details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20),
                height: 178,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/map.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void getData() async {
  Response response = await get(Uri.parse('https://api.covid19api'
      '.com/summary'));
  if (response.statusCode == 200) {
    String data = response.body;
    var newConfirmed = jsonDecode(data) ['Global'] ['NewConfirmed'];
    print("New Confirmed Cases are $newConfirmed ");
    var totalConfirmed = jsonDecode(data) ['Global'] ['TotalConfirmed'];
    print("Total Confirmed Cases are $totalConfirmed ");
    var newDeaths = jsonDecode(data) ['Global'] ['NewDeaths'];
    print("New Deaths are $newDeaths ");
    var totalDeaths = jsonDecode(data) ['Global'] ['TotalDeaths'];
    print("Total Deaths are $totalDeaths ");
    var newRecovered = jsonDecode(data) ['Global'] ['NewRecovered'];
    print("New Recovered are $newRecovered ");
    var totalRecovered = jsonDecode(data) ['Global'] ['TotalRecovered'];
    print("New Recovered are $totalRecovered ");
    var lastupdate = jsonDecode(data) ['Global'] ['Date'];
    print("Last Updates at $lastupdate ");
    } else {
    print(response.statusCode);
  }
}