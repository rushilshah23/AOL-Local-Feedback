import 'package:AOL_localfeedback/homePage.dart';
import 'package:AOL_localfeedback/language.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TranslationSelection extends StatefulWidget {
  @override
  _TranslationSelectionState createState() => _TranslationSelectionState();
}

class _TranslationSelectionState extends State<TranslationSelection> {
  int selected;

  @override
  void initState() {
    selected = 0;
    super.initState();
  }

  setSelectedRadio(int val) {
    setState(() {
      selected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var setLang = Provider.of<Language>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your language'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(100, 200, 100, 0),
        child: Center(
          child: Column(
            children: [
              Text("Defualt language is English"),
              SizedBox(
                height: 30,
              ),
              RadioListTile(
                  title: Text("English"),
                  value: 1,
                  groupValue: selected,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  }),
              RadioListTile(
                  title: Text("Hindi"),
                  value: 2,
                  groupValue: selected,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  }),
              RadioListTile(
                  title: Text("Marathi"),
                  value: 3,
                  groupValue: selected,
                  onChanged: (val) {
                    setSelectedRadio(val);
                  }),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(right: 40),
                child: Builder(
                  builder: (BuildContext context) {
                    return RaisedButton.icon(
                      onPressed: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();

                        if (selected == 1) {
                          setState(() {
                            setLang.setLang('en');
                            print(setLang.languageSelected);
                            sharedPreferences.setString('language', 'en');
                          });
                        } else if (selected == 2) {
                          setState(() {
                            setLang.setLang('hi');
                            print(setLang.languageSelected);
                            sharedPreferences.setString('language', 'hi');
                          });
                        } else if (selected == 3) {
                          setState(() {
                            setLang.setLang('mr');
                            print(setLang.languageSelected);
                            print(setLang.getLang());
                            sharedPreferences.setString('language', 'mr');
                          });
                        }
                        setState(() {
                          sharedPreferences.setBool('setLanguage', true);
                        });

                        // Scaffold.of(context).showSnackBar(
                        //     SnackBar(content: Text("Language setted")));

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MyHomePage(
                        //               title: 'HomePage1',
                        //             )),);

                        // Phoenix.rebirth(context);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                      title: 'Home Page',
                                    )));
                      },
                      icon: Icon(Icons.language),
                      label: Text("Continue"),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}