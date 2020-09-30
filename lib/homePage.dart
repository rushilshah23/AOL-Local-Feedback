import 'package:AOL_localfeedback/feedback.dart';
import 'package:AOL_localfeedback/language.dart';
import 'package:AOL_localfeedback/pageTranslations/homeText.dart';
import 'package:AOL_localfeedback/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  // MyHomePage({Key key, this.title}) : super(key: key);
  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences sharedPreferences;
  String language;
  List<Slide> slides = new List();
  // Language _languageHome;
  void initState() {
    print("in homepage");
    // _languageHome = context.read<Language>();
    super.initState();
    loadTextFields();
    slides.add(
      new Slide(
        title: 'We serve society by strengthening the individual',
        maxLineTitle: 2,
        styleTitle: TextStyle(
            color: Colors.white70,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic
        ),
        centerWidget: Container(
            width: 250.0,
            height: 150.0,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/logo.jpg')
                )
            )
        ),
        widgetDescription: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: RichText(
              text: new TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic
                ),
                children: <TextSpan>[
                  new TextSpan(text: '    Operating in 156 countries, The Art of Living is a non-profit, educational and humanitarian organization founded in 1981 by the world-renowned humanitarian and spiritual teacher - Gurudev Sri Sri Ravi Shankar. All our programs are guided by Gurudev’s philosophy: '),
                  new TextSpan(text: '“Unless we have a stress-free mind and a violence-free society, we cannot achieve world peace.”', style: new TextStyle(fontWeight: FontWeight.w800,letterSpacing: 2)),
                ],
              ),
            ),
          ),
        ),
        backgroundOpacity: 0.7,
        backgroundImage: 'assets/waterimg.jpg',
//        directionColorBegin: Alignment.topLeft,
//        directionColorEnd: Alignment.bottomRight,
//        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
          backgroundImage: 'assets/waterimg.jpg',
          title:
          "\nThe Art of Living community is diverse and attracts people from all walks of life.",
          maxLineTitle: 4,
          styleTitle:
          TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
          centerWidget: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '39 years of service',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 15),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(height: 15),
                  Container(
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.language,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              '156 countries where we make a difference',
                              style: TextStyle(
                                  fontSize: 18,

                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 15),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(height: 15),
                  Container(
                      height: 50,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              '10,000+ centers worldwide with weekly follow-up sessions',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 15),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                  SizedBox(height: 15),
                  Container(
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.people,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              '450 million lives touched',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ),
//        colorBegin: Color(0xffe2f3fb),
//        colorEnd: Color(0xff005c9d),
//        directionColorBegin: Alignment.topCenter,
//        directionColorEnd: Alignment.bottomCenter,
          backgroundOpacity: 0.7
      ),
    );
    slides.add(
      new Slide(
          title: "FOUNDER",
          centerWidget: Container(
              width: 190.0,
              height: 190.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/photo.jpg')
                  )
              )
          ),
          widgetDescription: Center(
              child: Column(
                children: [
                  Text(
                    "Sri Sri Ravi Shankar Ji",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22,color: Color(0xffe2f3fb),fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Center(
                      child: Text(
                        'Gurudev Sri Sri Ravi Shankar has united people of different races, traditions, economic and social status, and nationalities.',
                        style: TextStyle(fontSize: 18,color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Center(
//                  child: Text(
//                    'Gurudev’s message is simple: “Love and wisdom can prevail over hatred and violence.” This message is not just a slogan, but through The Art of Living has been and continues to be translated into action and results.',
//                    style: TextStyle(fontSize: 18,color: Colors.white70),
//                  ),
                      child: RichText(
                        text: new TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic
                          ),
                          children: <TextSpan>[
                            new TextSpan(text: 'Gurudev’s message is simple: '),
                            new TextSpan(text: '“Love and wisdom can prevail over hatred and violence.”', style: new TextStyle(fontWeight: FontWeight.w800,letterSpacing: 2)),
                            new TextSpan(text: 'This message is not just a slogan, but through The Art of Living has been and continues to be translated into action and results.')
                          ],
                        ),
                      ),
                    ),

                  ),
                ],
              )
          ),
          backgroundImage: 'assets/waterimg.jpg',
          backgroundOpacity: 0.7

      ),
    );
    slides.add(
      new Slide(
          title: 'Contact Us',
          centerWidget: Text('India Office',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 20),),
          widgetDescription: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Phone: +91-8067612345',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Fax: +91-8028432833',
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
                SizedBox(height: 20),
                RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 2,
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocalFeedback()
                          )
                      );
                    },
                    icon: Icon(Icons.feedback),
                    label: Text('Feedback',style: TextStyle(fontWeight: FontWeight.bold),)
                ),
              ],
            ),
          ),
          backgroundImage: 'assets/waterimg.jpg',
          backgroundOpacity: 0.7
      ),
    );
  }

  loadTextFields() async {
    sharedPreferences = await SharedPreferences.getInstance();
    language = sharedPreferences.getString('language');
    if (language != 'en') {
      for (var i = 0; i < homeText.length; i++) {
        await Language(language).getTranslation(homeText[i]).then((value) {
          setState(() {
            homeText[i] = value;
          });
        });
      }
    }
    // return text1 =
    //     (await _langVar.getTranslation('We serve the society')).toString();
  }

  @override



  Widget build(BuildContext context) {
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
        title: Text(homeText[19]),
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
      body: IntroSlider(
        isShowSkipBtn: false,
        isShowPrevBtn: true,
        slides: this.slides,
        colorActiveDot: Colors.white,
        colorDot: Colors.white30,
        isScrollable: true,
        renderNextBtn: Icon(Icons.arrow_forward_ios,color: Colors.white),
        renderPrevBtn: Icon(Icons.arrow_back_ios,color: Colors.white),
      ),
    );
  }
}
