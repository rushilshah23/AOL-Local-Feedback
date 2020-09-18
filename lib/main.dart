import 'package:AOL_localfeedback/language.dart';

import 'package:AOL_localfeedback/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(Phoenix(
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool setLanguage;
  void initState() {
    // getLanguageInfo();
    super.initState();
  }

  // Future<bool> getLanguageInfo() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     setLanguage = sharedPreferences.getBool('setLanguage' ?? false);
  //   });

  //   return setLanguage;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Language>(
      create: (context) => Language(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
        // (setLanguage == true)
        //     ? MyHomePage(
        //         title: 'HomePage',
        //       )
        //     : TranslationSelection(),
        // home: MyHomePage(title: 'Home Page'),
      ),
    );
  }
}
