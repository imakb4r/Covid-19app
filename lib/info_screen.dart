import 'package:covid_19/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/my_header.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to Know",
              textBottom: "About COVID-19.",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SymptomsCard(
                        image: "assets/images/headache.png",
                        title: "Headache",
                        isActive: true,
                      ),
                      SymptomsCard(
                        image: "assets/images/caugh.png",
                        title: "Cough",
                        isActive: true,
                      ),
                      SymptomsCard(
                        image: "assets/images/fever.png",
                        title: "Fever",
                        isActive: true,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Preventions", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  PreventCard(
                    text: "Since the start of the coronavirus outbreak some "
                        "places have fully embraced wearing facemasks",
                    image: "assets/images/wear_mask.png",
                    title: "Wear a Face Mask",
                  ),
                  PreventCard(
                    text: "Wash Hand carefully.",
                    image: "assets/images/wash_hands.png",
                    title: "Wash Hands.",
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  

  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.title,
    this.image,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 24,
                    )
                  ]),
            ),
            Image.asset(image),
            Positioned(
                left: 130,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  height: 136,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: kTitleTextstyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          "assets/icons/forward.svg",
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class SymptomsCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomsCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                )
        ],
      ),
      child: Column(
        children: [
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
