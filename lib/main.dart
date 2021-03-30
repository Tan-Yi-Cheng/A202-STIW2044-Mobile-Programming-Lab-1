import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController numAgeController = new TextEditingController();
  TextEditingController numHeightController = new TextEditingController();
  TextEditingController numWeightController = new TextEditingController();
  TextEditingController numWaistController = new TextEditingController();

  int sex = 0;
  double absi = 0.0;
  double absiMean = 0.0;
  double absiSD = 0.0;
  double absiZscore = 0.0;
  String absiword = "--";
  String absiZscoreword = "--";
  String absiMessage = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text("ABSI Calculator"),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/lab01.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sex",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.5,
                          ),
                          Container(
                            width: 100,
                            child: RaisedButton(
                              child: Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              onPressed: maleButton,
                            ),
                          ),
                          Container(
                            width: 100,
                            child: RaisedButton(
                              child: Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              onPressed: femaleButton,
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Age (Years)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.5,
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              controller: numAgeController,
                            ),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Height (CM)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.5,
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              controller: numHeightController,
                            ),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Weight (KG)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.5,
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              controller: numWeightController,
                            ),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Waist Circumference (CM)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.5,
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              controller: numWaistController,
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            onPressed: reset,
                          ),
                          RaisedButton(
                            child: Text(
                              "Calculate",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            onPressed: calculate,
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            child: Text(""), //add gap
                          ),
                        ]),
                    //result
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            child: Text(
                              "Result of ABSI :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            child: Text(
                              absiword,
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            child: Text(
                              "Result of ABSI (Z-Score) :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            child: Text(
                              absiZscoreword,
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            child: Text(""), //add gap
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            child: Text(
                              absiMessage,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            child: Text("Thanks For Using Me!"), //add gap
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void calculate() {
    setState(() {
      int age = int.parse(numAgeController.text);
      double height = double.parse(numHeightController.text);
      double weight = double.parse(numWeightController.text);
      double waistCircumference = double.parse(numWaistController.text);
      double bmi = 0;

      waistCircumference = (waistCircumference / 100);
      height = (height / 100);
      bmi = weight / (pow(height, 2));

      if (age >= 2 && age <= 85) {
        absi = waistCircumference / ((pow(bmi, 2 / 3)) * (pow(height, 1 / 2)));
      } else
        absi = 0;

      absiword = absi.toString();

      if (sex == 0) {
        switch (age) {
          case 2:
            absiMean = 0.0789;
            absiSD = 0.00384;
            break;
          case 3:
            absiMean = 0.07915;
            absiSD = 0.00384;
            break;
          case 4:
            absiMean = 0.07937;
            absiSD = 0.00383;
            break;
          case 5:
            absiMean = 0.07955;
            absiSD = 0.00383;
            break;
          case 6:
            absiMean = 0.07964;
            absiSD = 0.00382;
            break;
          case 7:
            absiMean = 0.07966;
            absiSD = 0.00382;
            break;
          case 8:
            absiMean = 0.07958;
            absiSD = 0.00382;
            break;
          case 9:
            absiMean = 0.07942;
            absiSD = 0.00381;
            break;
          case 10:
            absiMean = 0.07917;
            absiSD = 0.00381;
            break;

          case 11:
            absiMean = 0.07886;
            absiSD = 0.00381;
            break;
          case 12:
            absiMean = 0.07849;
            absiSD = 0.0038;
            break;
          case 13:
            absiMean = 0.0781;
            absiSD = 0.0038;
            break;
          case 14:
            absiMean = 0.07772;
            absiSD = 0.0038;
            break;
          case 15:
            absiMean = 0.07739;
            absiSD = 0.00379;
            break;
          case 16:
            absiMean = 0.07716;
            absiSD = 0.00379;
            break;
          case 17:
            absiMean = 0.07703;
            absiSD = 0.00378;
            break;
          case 18:
            absiMean = 0.07702;
            absiSD = 0.00378;
            break;
          case 19:
            absiMean = 0.07711;
            absiSD = 0.00378;
            break;
          case 20:
            absiMean = 0.07728;
            absiSD = 0.00377;
            break;

          case 21:
            absiMean = 0.0775;
            absiSD = 0.00377;
            break;
          case 22:
            absiMean = 0.07777;
            absiSD = 0.00377;
            break;
          case 23:
            absiMean = 0.07804;
            absiSD = 0.00376;
            break;
          case 24:
            absiMean = 0.07831;
            absiSD = 0.00376;
            break;
          case 25:
            absiMean = 0.07858;
            absiSD = 0.00376;
            break;
          case 26:
            absiMean = 0.07882;
            absiSD = 0.00375;
            break;
          case 27:
            absiMean = 0.07904;
            absiSD = 0.00375;
            break;
          case 28:
            absiMean = 0.07922;
            absiSD = 0.00374;
            break;
          case 29:
            absiMean = 0.07938;
            absiSD = 0.00374;
            break;
          case 30:
            absiMean = 0.07951;
            absiSD = 0.00374;
            break;

          case 31:
            absiMean = 0.07963;
            absiSD = 0.00373;
            break;
          case 32:
            absiMean = 0.07975;
            absiSD = 0.00373;
            break;
          case 33:
            absiMean = 0.07988;
            absiSD = 0.00373;
            break;
          case 34:
            absiMean = 0.08;
            absiSD = 0.00372;
            break;
          case 35:
            absiMean = 0.08013;
            absiSD = 0.00372;
            break;
          case 36:
            absiMean = 0.08027;
            absiSD = 0.00371;
            break;
          case 37:
            absiMean = 0.08042;
            absiSD = 0.00371;
            break;
          case 38:
            absiMean = 0.08057;
            absiSD = 0.00371;
            break;
          case 39:
            absiMean = 0.08072;
            absiSD = 0.0037;
            break;
          case 40:
            absiMean = 0.08087;
            absiSD = 0.0037;
            break;

          case 41:
            absiMean = 0.08102;
            absiSD = 0.0037;
            break;
          case 42:
            absiMean = 0.08117;
            absiSD = 0.00369;
            break;
          case 43:
            absiMean = 0.08132;
            absiSD = 0.00369;
            break;
          case 44:
            absiMean = 0.08148;
            absiSD = 0.00368;
            break;
          case 45:
            absiMean = 0.08165;
            absiSD = 0.00368;
            break;
          case 46:
            absiMean = 0.08183;
            absiSD = 0.00368;
            break;
          case 47:
            absiMean = 0.08201;
            absiSD = 0.00367;
            break;
          case 48:
            absiMean = 0.0824;
            absiSD = 0.00367;
            break;
          case 49:
            absiMean = 0.08221;
            absiSD = 0.00367;
            break;
          case 50:
            absiMean = 0.0826;
            absiSD = 0.00366;
            break;

          case 51:
            absiMean = 0.08297;
            absiSD = 0.00366;
            break;
          case 52:
            absiMean = 0.08297;
            absiSD = 0.00365;
            break;
          case 53:
            absiMean = 0.08315;
            absiSD = 0.00365;
            break;
          case 54:
            absiMean = 0.08334;
            absiSD = 0.00365;
            break;
          case 55:
            absiMean = 0.08352;
            absiSD = 0.00364;
            break;
          case 56:
            absiMean = 0.08369;
            absiSD = 0.00364;
            break;
          case 57:
            absiMean = 0.08386;
            absiSD = 0.00364;
            break;
          case 58:
            absiMean = 0.08403;
            absiSD = 0.00363;
            break;
          case 59:
            absiMean = 0.08419;
            absiSD = 0.00363;
            break;
          case 60:
            absiMean = 0.08436;
            absiSD = 0.00362;
            break;

          case 61:
            absiMean = 0.08454;
            absiSD = 0.00362;
            break;
          case 62:
            absiMean = 0.08471;
            absiSD = 0.00362;
            break;
          case 63:
            absiMean = 0.08489;
            absiSD = 0.00361;
            break;
          case 64:
            absiMean = 0.08506;
            absiSD = 0.00361;
            break;
          case 65:
            absiMean = 0.08522;
            absiSD = 0.0036;
            break;
          case 66:
            absiMean = 0.08537;
            absiSD = 0.0036;
            break;
          case 67:
            absiMean = 0.08551;
            absiSD = 0.0036;
            break;
          case 68:
            absiMean = 0.08565;
            absiSD = 0.00359;
            break;
          case 69:
            absiMean = 0.08578;
            absiSD = 0.00359;
            break;
          case 70:
            absiMean = 0.08591;
            absiSD = 0.00359;
            break;
          case 71:
            absiMean = 0.08604;
            absiSD = 0.00358;
            break;
          case 72:
            absiMean = 0.08616;
            absiSD = 0.00358;
            break;
          case 73:
            absiMean = 0.08629;
            absiSD = 0.00357;
            break;
          case 74:
            absiMean = 0.08641;
            absiSD = 0.00357;
            break;
          case 75:
            absiMean = 0.08653;
            absiSD = 0.00357;
            break;
          case 76:
            absiMean = 0.08665;
            absiSD = 0.00356;
            break;
          case 77:
            absiMean = 0.08675;
            absiSD = 0.00356;
            break;
          case 78:
            absiMean = 0.08685;
            absiSD = 0.00355;
            break;
          case 79:
            absiMean = 0.08695;
            absiSD = 0.00355;
            break;
          case 80:
            absiMean = 0.08705;
            absiSD = 0.00355;
            break;

          case 81:
            absiMean = 0.08714;
            absiSD = 0.00354;
            break;
          case 82:
            absiMean = 0.08723;
            absiSD = 0.00354;
            break;
          case 83:
            absiMean = 0.08732;
            absiSD = 0.00354;
            break;
          case 84:
            absiMean = 0.08742;
            absiSD = 0.00353;
            break;
          case 85:
            absiMean = 0.08811;
            absiSD = 0.00356;
            break;
        }
      } else if (sex == 1) {
        switch (age) {
          case 2:
            absiMean = 0.08031;
            absiSD = 0.00363;
            break;
          case 3:
            absiMean = 0.08016;
            absiSD = 0.00366;
            break;
          case 4:
            absiMean = 0.08001;
            absiSD = 0.00369;
            break;
          case 5:
            absiMean = 0.07985;
            absiSD = 0.00372;
            break;
          case 6:
            absiMean = 0.07969;
            absiSD = 0.00375;
            break;
          case 7:
            absiMean = 0.07952;
            absiSD = 0.00378;
            break;
          case 8:
            absiMean = 0.07935;
            absiSD = 0.0038;
            break;
          case 9:
            absiMean = 0.07917;
            absiSD = 0.00383;
            break;
          case 10:
            absiMean = 0.07899;
            absiSD = 0.00386;
            break;

          case 11:
            absiMean = 0.07881;
            absiSD = 0.00389;
            break;
          case 12:
            absiMean = 0.07863;
            absiSD = 0.00392;
            break;
          case 13:
            absiMean = 0.07846;
            absiSD = 0.00395;
            break;
          case 14:
            absiMean = 0.07829;
            absiSD = 0.00397;
            break;
          case 15:
            absiMean = 0.07814;
            absiSD = 0.004;
            break;
          case 16:
            absiMean = 0.07799;
            absiSD = 0.00403;
            break;
          case 17:
            absiMean = 0.07787;
            absiSD = 0.00406;
            break;
          case 18:
            absiMean = 0.07775;
            absiSD = 0.00408;
            break;
          case 19:
            absiMean = 0.07765;
            absiSD = 0.00411;
            break;
          case 20:
            absiMean = 0.07757;
            absiSD = 0.00414;
            break;

          case 21:
            absiMean = 0.0775;
            absiSD = 0.00416;
            break;
          case 22:
            absiMean = 0.07744;
            absiSD = 0.00419;
            break;
          case 23:
            absiMean = 0.0774;
            absiSD = 0.00422;
            break;
          case 24:
            absiMean = 0.07737;
            absiSD = 0.00424;
            break;
          case 25:
            absiMean = 0.07735;
            absiSD = 0.00427;
            break;
          case 26:
            absiMean = 0.07734;
            absiSD = 0.00429;
            break;
          case 27:
            absiMean = 0.07735;
            absiSD = 0.00432;
            break;
          case 28:
            absiMean = 0.07736;
            absiSD = 0.00435;
            break;
          case 29:
            absiMean = 0.07739;
            absiSD = 0.00437;
            break;
          case 30:
            absiMean = 0.07743;
            absiSD = 0.0044;
            break;

          case 31:
            absiMean = 0.07747;
            absiSD = 0.00442;
            break;
          case 32:
            absiMean = 0.07752;
            absiSD = 0.00445;
            break;
          case 33:
            absiMean = 0.07759;
            absiSD = 0.00447;
            break;
          case 34:
            absiMean = 0.07766;
            absiSD = 0.0045;
            break;
          case 35:
            absiMean = 0.07773;
            absiSD = 0.00452;
            break;
          case 36:
            absiMean = 0.07782;
            absiSD = 0.00454;
            break;
          case 37:
            absiMean = 0.0779;
            absiSD = 0.00457;
            break;
          case 38:
            absiMean = 0.078;
            absiSD = 0.00459;
            break;
          case 39:
            absiMean = 0.0781;
            absiSD = 0.00462;
            break;
          case 40:
            absiMean = 0.0782;
            absiSD = 0.00464;
            break;

          case 41:
            absiMean = 0.07831;
            absiSD = 0.00466;
            break;
          case 42:
            absiMean = 0.07842;
            absiSD = 0.00469;
            break;
          case 43:
            absiMean = 0.07854;
            absiSD = 0.00471;
            break;
          case 44:
            absiMean = 0.07866;
            absiSD = 0.00473;
            break;
          case 45:
            absiMean = 0.07879;
            absiSD = 0.00476;
            break;
          case 46:
            absiMean = 0.07892;
            absiSD = 0.00478;
            break;
          case 47:
            absiMean = 0.07905;
            absiSD = 0.0048;
            break;
          case 48:
            absiMean = 0.07919;
            absiSD = 0.00483;
            break;
          case 49:
            absiMean = 0.07933;
            absiSD = 0.00485;
            break;
          case 50:
            absiMean = 0.07947;
            absiSD = 0.00487;
            break;

          case 51:
            absiMean = 0.07962;
            absiSD = 0.00489;
            break;
          case 52:
            absiMean = 0.07977;
            absiSD = 0.00492;
            break;
          case 53:
            absiMean = 0.07992;
            absiSD = 0.00494;
            break;
          case 54:
            absiMean = 0.08007;
            absiSD = 0.00496;
            break;
          case 55:
            absiMean = 0.08023;
            absiSD = 0.00498;
            break;
          case 56:
            absiMean = 0.08039;
            absiSD = 0.00501;
            break;
          case 57:
            absiMean = 0.08055;
            absiSD = 0.00503;
            break;
          case 58:
            absiMean = 0.08072;
            absiSD = 0.00505;
            break;
          case 59:
            absiMean = 0.08088;
            absiSD = 0.00507;
            break;
          case 60:
            absiMean = 0.08105;
            absiSD = 0.00509;
            break;

          case 61:
            absiMean = 0.08122;
            absiSD = 0.00511;
            break;
          case 62:
            absiMean = 0.08139;
            absiSD = 0.00514;
            break;
          case 63:
            absiMean = 0.08156;
            absiSD = 0.00516;
            break;
          case 64:
            absiMean = 0.08174;
            absiSD = 0.00518;
            break;
          case 65:
            absiMean = 0.08191;
            absiSD = 0.0052;
            break;
          case 66:
            absiMean = 0.08208;
            absiSD = 0.00522;
            break;
          case 67:
            absiMean = 0.08226;
            absiSD = 0.00524;
            break;
          case 68:
            absiMean = 0.08243;
            absiSD = 0.00526;
            break;
          case 69:
            absiMean = 0.08261;
            absiSD = 0.00528;
            break;
          case 70:
            absiMean = 0.08278;
            absiSD = 0.0053;
            break;

          case 71:
            absiMean = 0.08296;
            absiSD = 0.00533;
            break;
          case 72:
            absiMean = 0.08313;
            absiSD = 0.00535;
            break;
          case 73:
            absiMean = 0.0833;
            absiSD = 0.00537;
            break;
          case 74:
            absiMean = 0.08346;
            absiSD = 0.00539;
            break;
          case 75:
            absiMean = 0.08363;
            absiSD = 0.00541;
            break;
          case 76:
            absiMean = 0.0838;
            absiSD = 0.00543;
            break;
          case 77:
            absiMean = 0.08396;
            absiSD = 0.00545;
            break;
          case 78:
            absiMean = 0.08412;
            absiSD = 0.00547;
            break;
          case 79:
            absiMean = 0.08428;
            absiSD = 0.00549;
            break;
          case 80:
            absiMean = 0.08444;
            absiSD = 0.00551;
            break;

          case 81:
            absiMean = 0.0846;
            absiSD = 0.00553;
            break;
          case 82:
            absiMean = 0.08476;
            absiSD = 0.00555;
            break;
          case 83:
            absiMean = 0.08492;
            absiSD = 0.00557;
            break;
          case 84:
            absiMean = 0.08508;
            absiSD = 0.00559;
            break;
          case 85:
            absiMean = 0.08533;
            absiSD = 0.00528;
            break;
        }
      }

      if (age >= 2 && age <= 85) {
        absiZscore = (absi - absiMean) / absiSD;
      } else
        absiZscore = 0;

      absiZscoreword = absiZscore.toString();

      if (age >= 2 && age <= 85) {
        if (absiZscore < -0.868) {
          absiMessage =
              "According to your ABSI z score, \nyour premature mortality risk \nis very low.";
        } else if (absiZscore >= -0.868 && absiZscore < -0.272) {
          absiMessage =
              "According to your ABSI z score, \nyour premature mortality risk \nis low.";
        } else if (absiZscore >= -0.272 && absiZscore < -0.229) {
          absiMessage =
              "According to your ABSI z score, \nyour premature mortality risk \nis average.";
        } else if (absiZscore >= -0.229 && absiZscore < -0.798) {
          absiMessage =
              "According to your ABSI z score, \nyour premature mortality risk \nis high.";
        } else if (absiZscore >= -0.798) {
          absiMessage =
              "According to your ABSI z score, \nyour premature mortality risk \nis very high.";
        }
      } else
        absiMessage = "This ABSI Calculate only for \nAGE betwwen 2 to 85.";
    });
  }

  void maleButton() {
    setState(() {
      sex = 0;
    });
  }

  void femaleButton() {
    setState(() {
      sex = 1;
    });
  }

  void reset() {
    setState(() {
      numAgeController.clear();
      numHeightController.clear();
      numWeightController.clear();
      numWaistController.clear();
      absiword = "--";
      absiZscoreword = "--";
      absiMessage = "";
    });
  }
}
