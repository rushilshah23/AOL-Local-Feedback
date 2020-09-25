import 'package:AOL_localfeedback/language.dart';

import 'package:AOL_localfeedback/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool setLanguage;
  String getSetLanguage;
  void initState() {
    getLanguageInfo();
    super.initState();
  }

  Future<bool> getLanguageInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      setLanguage = sharedPreferences.getBool('setLanguage' ?? false);
      getSetLanguage = sharedPreferences.getString('language' ?? 'en');
    });

    return setLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Language>(
      create: (context) => Language(getSetLanguage),
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
