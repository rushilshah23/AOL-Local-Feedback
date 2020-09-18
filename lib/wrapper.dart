import 'package:AOL_localfeedback/homePage.dart';
import 'package:AOL_localfeedback/language.dart';
import 'package:AOL_localfeedback/main.dart';
import 'package:AOL_localfeedback/translationPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _langSet = Provider.of<Language>(context);

    if (_langSet.checkLangSet() == false) {
      return TranslationSelection();
    } else
      return MyHomePage(title: 'Home');
  }
}
