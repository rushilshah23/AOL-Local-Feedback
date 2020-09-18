import 'package:AOL_localfeedback/feedback.dart';
import 'package:AOL_localfeedback/language.dart';
import 'package:AOL_localfeedback/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  // MyHomePage({Key key, this.title}) : super(key: key);
  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text1 = 'rggerb';
  void initState() {
    super.initState();
    loadTextFields().then((value) {
      setState(() {});
    });
  }

  Future<void> loadTextFields() async {
    setState(() async {
      text1 = await Language()
          .getTranslation('We serve the society by helping the needy people');
    });

    // return text1 =
    //     (await _langVar.getTranslation('We serve the society')).toString();
  }

  @override
  Widget build(BuildContext context) {
    Language _langVar = Provider.of<Language>(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [const Color(0xFFFF8F00), const Color(0xFFFFc107)],
            ),
          ),
        ),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          // Container(
          //   child: RaisedButton.icon(
          //       color: Colors.blue,
          //       highlightColor: Colors.transparent,
          //       onPressed: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => TranslationSelection()));
          //       },
          //       icon: Icon(Icons.language),
          //       label: Text('Languages')),
          // )
        ],
      ),
      drawer: myDrawer(
        context,
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
                text1,
                // awaitloadTextFields(),
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
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocalFeedback()));
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xFFFF8F00), const Color(0xFFFFc107)],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.feedback),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Feedback',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
