import 'package:AOL_localfeedback/translationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './feedback.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool setLanguage;
  void initState() {
    getLanguageInfo();
    super.initState();
  }

  Future<bool> getLanguageInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      setLanguage = sharedPreferences.getBool('setLanguage' ?? false);
    });

    return setLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (setLanguage == true)
          ? MyHomePage(
              title: 'HomePage',
            )
          : TranslationSelection(),
      // home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _language;
  GoogleTranslator translator = GoogleTranslator();

  String text = "We serve society by strengthening the individual";

  void initState() {
    loadLanguage().then((value) {
      print(_language);
    });
    translate(text);
    // print(_language);
    super.initState();
  }

  Future<String> loadLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _language = sharedPreferences.getString('language');
    });

    return _language;
  }

  void translate(String text) {
    translator.translate(text, to: _language).then((output) {
      setState(() {
        text = output.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Container(
            color: Colors.transparent,
            child: RaisedButton.icon(
                color: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TranslationSelection()));
                },
                icon: Icon(Icons.language),
                label: Text('Languages')),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset('assets/logo.jpg'),
              height: 120,
              width: 120,
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "ABOUT US",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Operating in 156 countries, The Art of Living is a non-profit, educational and humanitarian organization founded in 1981 by the world-renowned humanitarian and spiritual teacher - Gurudev Sri Sri Ravi Shankar. All our programs are guided by Gurudev’s philosophy: “Unless we have a stress-free mind and a violence-free society, we cannot achieve world peace.”',
                style: TextStyle(fontSize: 18, wordSpacing: 2),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'The Art of Living community is diverse and attracts people from all walks of life.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/map.jpg'), fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '39\nyears of service',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '156\ncountries where we make\na difference',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '10,000+\ncenters worldwide with \nweekly follow-up sessions',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        size: 80,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '450 million\nlives touched',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Founder",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              height: 220,
              width: 300,
              child: Image.asset('assets/photo.jpg'),
            ),
            Center(
              child: Text(
                "Sri Sri Ravi Shankar Ji",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Gurudev Sri Sri Ravi Shankar has united people of different races, traditions, economic and social status, and nationalities.This community, spanning 156 countries, has created a one-world spiritual family.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                'Gurudev’s message is simple: “Love and wisdom can prevail over hatred and violence.” This message is not just a slogan, but through The Art of Living has been and continues to be translated into action and results.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Contact Us',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'India Office',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Phone: +91 8067612345',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Fax: +91 8028432833',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email: secretariat@artofliving.org',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Address: Office of gurudev Sri Sri Ravi Shankar,The Art of living International centre',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 2,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocalFeedback()));
                  },
                  icon: Icon(Icons.feedback),
                  label: Text('Feedback')),
            )
          ],
        ),
      ),
    );
  }
}
