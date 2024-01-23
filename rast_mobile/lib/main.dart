import 'package:flutter/material.dart';
import 'package:rast_mobile/consts.dart';
import 'package:rast_mobile/screens/homeScreen.dart';
import 'package:rast_mobile/screens/splashScreen.dart';
import 'package:rast_mobile/screens/taskDetailsScreen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    myHeight = MediaQuery.of(context).size.height;
    myWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        HomeScreen.rout: (context) => const HomeScreen(),
        TaskDetailsScreen.rout: (context) => const TaskDetailsScreen(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        //  useMaterial3: true,
      ),
      home: const SplashScreen(),
      //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
