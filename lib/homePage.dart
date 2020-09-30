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
        title: homeText[1],
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
            child: Text(
              homeText[2],
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic
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
          title: homeText[3],
          maxLineTitle: 4,
          styleTitle:
          TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
          centerWidget: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
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
                            homeText[4],
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
                    height: 2,
                    color: Colors.white,
                  ),
                  SizedBox(height: 15),
                  Container(
                      height: 60,
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
                              homeText[5],
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
                    height: 2,
                    color: Colors.white,
                  ),
                  SizedBox(height: 15),
                  Container(
                      height: 60,
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
                              homeText[6],
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
                    height: 2,
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
                              homeText[7],
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
          title: homeText[8],
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
                    homeText[9],
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22,color: Color(0xffe2f3fb),fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Center(
                      child: Text(
                        homeText[10],
                        style: TextStyle(fontSize: 18,color: Colors.white70),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Center(
                      child: Text(
                        homeText[11],
                        style: TextStyle(fontSize: 18,color: Colors.white70,fontStyle: FontStyle.italic),
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
          title: homeText[12],
          centerWidget: Text(homeText[13],style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 20),),
          widgetDescription: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    homeText[14],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    homeText[15],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    homeText[16],
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    homeText[17],
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
                    label: Text(homeText[18],style: TextStyle(fontWeight: FontWeight.bold),)
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
