import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Language with ChangeNotifier {
  String _language;
  bool _languageSelected;
  String translation = '';
  Language();

  GoogleTranslator _googleTranslator = GoogleTranslator();

  getLang() => _language;
  setLang(String language) {
    _language = language;
    _languageSelected = true;
    notifyListeners();
  }

  checkLangSet() => _languageSelected;

  Future<String> getTranslation(String input) async {
    print('translating');
    translation = (await _googleTranslator.translate(input)).toString();
    print('translated');

    return translation;
  }
}
