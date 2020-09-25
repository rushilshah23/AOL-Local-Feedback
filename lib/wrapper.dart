import 'package:AOL_localfeedback/homePage.dart';
import 'package:AOL_localfeedback/language.dart';

import 'package:AOL_localfeedback/translationPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _langSet = Provider.of<Language>(context);
    print(_langSet.languageSelected);

    if (_langSet.languageSelected == false) {
      return TranslationSelection();
    } else
      return MyHomePage(title: 'Home');
  }
}
