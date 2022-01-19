// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:fsk/domain/adl/intro.dart';
import 'package:fsk/domain/kemahiran_adl.dart';
import 'package:fsk/domain/adl/adl1.dart';
import 'package:fsk/domain/motor_halus.dart';
import 'package:fsk/domain/motorhalus/introslidermotorhalus.dart';
import 'package:fsk/domain/motorkasar/introslider_motorkasar.dart';
import 'package:fsk/domain/perkembangan_sosial.dart';
import 'package:fsk/widget/navigation_drawer.dart';
import 'package:fsk/domain/motor_kasar.dart';
import 'package:fsk/menu_bar/HP_kemahiranADL.dart';
import 'package:fsk/menu_bar/HP_motorhalus.dart';
import 'package:fsk/menu_bar/HP_perkembangansosial.dart';
import 'package:fsk/widget/navigation_drawer.dart';
import 'package:fsk/menu_bar/HP_motorkasar.dart';

class domain extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Domain'),
        centerTitle: true,
        backgroundColor: Color(0XFF40E0D0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage("assets/motorkasar.jpg"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text("Perkembangan Motor Kasar")
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntroSliderMotorKasar()));
              },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage("assets/motorhalus.jpg"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Perkembangan Motor Halus dan Kemahiran Pra-menulis",
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntroSliderMotorHalus()));
              },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage("assets/adl.jpg"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        "Penilaian Kemahiran Melakukan Aktiviti Kehidupan Harian(ADL)",
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntroSliderPage()));
              },
            ),
            InkWell(
              child: Container(
                child: Card(
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image(
                          image: AssetImage("assets/kognitif.jpg"),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text("Penilaian Social dan Kognitif")
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => perkembanganSosial()));
              },
            ),
          ],
        ),
      ));
}

    /* // final double _borderRadius = 24;
  List<String> events = [
    "Perkembangan Motor Kasar",
    "Perkembangan Motor Halus dan Kemahiran Pra-menulis",
    "Penilaian Kemahiran Melakukan Aktiviti Kehidupan Harian(ADL)",
    "Penilaian Social dan Kognitif",
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Domain'),
          centerTitle: true,
          backgroundColor: const Color(0XFF40E0D0),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: (Container(
            margin: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView(
                //physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10),
                children: events.map((title) {
                  //loop item
                  return GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.only(top: 20),
                      child: getCardByTitle(title),
                    ),
                  );
                }).toList(),
              ),
            ),
          )),
        ),
      );
    );
  }
}     
          
}

Column getCardByTitle(String title) {
  String img = "";
  if (title == "Perkembangan Motor Kasar") {
    img = "assets/motorkasar.jpg";
  } else if (title == "Perkembangan Motor Halus dan Kemahiran Pra-menulis") {
    img = "assets/motorhalus.jpg";
  } else if (title ==
      "Penilaian Kemahiran Melakukan Aktiviti Kehidupan Harian(ADL)") {
    img = "assets/adl.jpg";
  } else if (title == "Penilaian Social dan Kognitif") {
    img = "assets/kognitif.jpg";
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Center(
        child: new Stack(
          children: <Widget>[
            ClipOval(
              child: new Image.asset(
                img,
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
      Text(
        title,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      )
    ],
   
  );*/
