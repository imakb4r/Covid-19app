import 'package:flutter/material.dart';
import 'package:covid_19/about.dart';
import 'package:covid_19/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/counter.dart';
import 'widgets/my_header.dart';
import 'package:covid_19/networking.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({this.covidData});
  final covidData;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int newConfirmed;
  int newRecovered;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int totalRecovered;
  var lastupdate;
  @override
  void initState() {
    super.initState();
    updateData(widget.covidData);
  }

  void updateData(dynamic apiData) {

    newConfirmed = apiData ['Global'] ['NewConfirmed'];
    totalConfirmed = apiData['Global'] ['TotalConfirmed'];
    newDeaths = apiData ['Global'] ['NewDeaths'];
    totalDeaths = apiData ['Global'] ['TotalDeaths'];
    newRecovered = apiData ['Global'] ['NewRecovered'];
    totalRecovered = apiData ['Global'] ['TotalRecovered'];
    lastupdate = apiData ['Global'] ['Date'];
  }

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
                            text: "Newest update $lastupdate",
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
                      number: '$totalConfirmed',
                    ),
                    Counter(
                      color: kDeathColor,
                      title: "Deaths",
                      number: '$totalDeaths',
                    ),
                    Counter(
                      color: kRecovercolor,
                      title: "Recovered",
                      number: '$totalRecovered',
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
        appBar: AppBar(
          title: Text("Hello"),
        ),
        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('About'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return AboutUs();
                      }));
                    },
                  ),
                ])));
  }
}
