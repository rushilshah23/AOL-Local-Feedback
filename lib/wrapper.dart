import 'package:AOL_localfeedback/homePage.dart';

import 'package:AOL_localfeedback/translationPage.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  var lang;
  bool langSet;
  SharedPreferences sharedPreferences;
  void initState() {
    loadLang();
    super.initState();
  }

  Future<void> loadLang() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      print("setting state");
      lang = sharedPreferences.getString('language') ?? 'mr';
      langSet = sharedPreferences.getBool('setLanguage') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final _langSet = Provider.of<Language>(context);
    // print(_langSet.languageSelected);

    // if (_langSet.languageSelected == false) {
    print(langSet);
    print(lang);
    if (langSet != true) {
      return TranslationSelection();
    } else
      return MyHomePage(title: 'Home');
  }
}
