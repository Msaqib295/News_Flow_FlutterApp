import 'package:flutter/material.dart';
import 'package:news_flow_flutterapp/view/home.dart';
import 'package:news_flow_flutterapp/view/widget/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool showingSplash = true;
  LoadHome() {
    Future.delayed(Duration(seconds: 3) , () {
     setState(() {
       showingSplash = false;
     });
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHome();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Flow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: showingSplash? Splashscreen() : HomeScreen(),
    );
  }
}
