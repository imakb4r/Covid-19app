import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/wear_mask.png"),
              ),
              Text(
                'Akbar Ansari',
                style: TextStyle(
                  fontSize: 26.0,
                  fontFamily: 'Poppins',
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flutter App Developer',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade200,
                  letterSpacing: 1.5,
                ),
              ),
              Card(
                color: Colors.blueGrey.shade50,
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child:ListTile(
                  leading:Icon(
                    Icons.phone,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                      '+91 8878508868',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                )
              ),
              Card(
                  color: Colors.blueGrey.shade50,
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email_rounded,
                    color: Colors.teal.shade900,
                  ),
                  title: Text(
                      'imakb4r@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                )
              ),
              SizedBox(width: 500.0),
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Row(
                  children: [
                    Text(
                      'Made with ❤ by Akbar Ansari',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                                      ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
