import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          )),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//this variables for brightness & Volum
double firstSizeVertical = 0;
String txt = "";
String brightness = "";

//for Forward & backward
double firstSizeHorizontal = 0;
String txtForOrBack = "";

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                color: Colors.transparent,
                child: GestureDetector(
                  onVerticalDragStart: (details) {
                    firstSizeVertical = details.globalPosition.dy;
                    // print("start");
                  },
                  onVerticalDragUpdate: (details) {
                    // print("update");
                    // print(details.globalPosition.dy);
                    if (firstSizeVertical > details.globalPosition.dy) {
                      brightness = "brightnessUp";
                    } else {
                      brightness = "brightnessDown";
                    }
                    setState(() {});
                  },
                  onVerticalDragEnd: (details) {
                    // print("End");
                    brightness = "";
                    setState(() {});
                  },
                ),
              )),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onVerticalDragStart: (details) {
                      firstSizeVertical = details.globalPosition.dy;
                      // print("start");
                    },
                    onVerticalDragUpdate: (details) {
                      // print("update");
                      // print(details.globalPosition.dy);
                      if (firstSizeVertical > details.globalPosition.dy) {
                        txt = "VolumnUp";
                      } else {
                        txt = "VolumDown";
                      }
                      setState(() {});
                    },
                    onVerticalDragEnd: (details) {
                      // print("End");
                      txt = "";
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    brightness,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    txt,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onHorizontalDragStart: (details) {
              firstSizeHorizontal = details.globalPosition.dx;
            },
            onHorizontalDragUpdate: (details) {
              if (firstSizeHorizontal < details.globalPosition.dx) {
                txtForOrBack = "Forward";
              } else {
                txtForOrBack = "Backward";
              }

              setState(() {});
            },
            onHorizontalDragEnd: (details) {
              txtForOrBack = "";
              setState(() {});
            },
          ),
          Center(
            child: Text(
              txtForOrBack,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
