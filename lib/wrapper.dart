import 'package:AOL_localfeedback/homePage.dart';
import 'package:AOL_localfeedback/language.dart';

import 'package:AOL_localfeedback/translationPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  loadLang() async {
    sharedPreferences = await SharedPreferences.getInstance();
    lang = sharedPreferences.getString('language');
    langSet = sharedPreferences.getBool('setLanguage') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final _langSet = Provider.of<Language>(context);
    print(_langSet.languageSelected);

    // if (_langSet.languageSelected == false) {
    if (langSet == false) {
      return TranslationSelection();
    } else
      return MyHomePage(title: 'Home');
  }
}
