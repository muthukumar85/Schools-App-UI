import 'package:flutter/material.dart';
import 'package:schools/Pages/loginhome.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:schools/constants/Theme.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ArgonColors.primary, // Change the color here
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
         fontFamily: 'OpenSans',
        primarySwatch: Colors.blue,
      ),
        initialRoute: '/home',
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          // "/onboarding": (BuildContext context) => new Onboarding(),
          // "/home": (BuildContext context) => new Home(),
          // "/profile": (BuildContext context) => new Profile(),
          // "/articles": (BuildContext context) => new Articles(),
          // "/elements": (BuildContext context) => new Elements(),
          "/home": (BuildContext context) => Loginhome(),
          // "/pro": (BuildContext context) => new Pro(),
        });

  }
}


