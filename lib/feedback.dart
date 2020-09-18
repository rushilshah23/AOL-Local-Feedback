//added popup
import 'package:AOL_localfeedback/statistics.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(context),
        title: "Local Feedback",
        home: Builder(builder: (BuildContext context) => LocalFeedback()));
  }
}

class LocalFeedback extends StatefulWidget {
  @override
  _LocalFeedbackState createState() => _LocalFeedbackState();
}

class _LocalFeedbackState extends State<LocalFeedback> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _contactNumber = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _feedback = new TextEditingController();
  TextEditingController _suggestions = new TextEditingController();
  TextEditingController _ratings = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController waterexcbef = new TextEditingController();
  TextEditingController waterexcaft = new TextEditingController();
  TextEditingController cropprodbef = new TextEditingController();
  TextEditingController cropprodaft = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // clearControllers();
  }

  void submitLocalFeedback() {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference();

    databaseReference.child("localFeedback").push().set({
      'name': _name.text,
      'contactNumber': _contactNumber.text,
      'email': _email.text,
      'address': _address.text,
      'waterexcbef': waterexcbef.text,
      'waterexcaft': waterexcaft.text,
      'cropprodbef': cropprodbef.text,
      'cropprodaft': cropprodaft.text,
      'feedback': _feedback.text,
      'suggestions': _suggestions.text,
      'timestamp': new DateFormat.yMd().add_jm().format(new DateTime.now()),
    });
  }

  void clearControllers() {
    _name.clear();
    _contactNumber.clear();
    _email.clear();
    _feedback.clear();
    _suggestions.clear();
    _ratings.clear();
    waterexcaft.clear();
    waterexcbef.clear();
    cropprodaft.clear();
    cropprodbef.clear();
  }

  Future<void> _showMyDialog() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ThankYou for the feedback !',
              style: TextStyle(
                letterSpacing: 2.0,
                fontWeight: FontWeight.normal,
                fontSize: 25,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.blue[900],
                shadows: [
                  Shadow(
                    color: Colors.blue,
                    blurRadius: 3.0,
                    offset: Offset(2.0, 2.0),
                  ),
                  Shadow(
                    color: Colors.red,
                    blurRadius: 4.0,
                    offset: Offset(-4.0, 4.0),
                  ),
                ],
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              mainAxis: Axis.vertical,
              children: <Widget>[
                Center(
                  child: Text(
                    'Your Response has been submitted.',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              hoverColor: Colors.red[400],
              color: Colors.black,
              child: Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: Colors.blue[400],
          elevation: 58.0,
          // shape: CircleBorder(),
        );
      },
    );
  }

  String nameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter a valid Name';
    } else
      return null;
  }

  String addressValidator(value) {
    if (value.isEmpty) {
      return 'Please enter a valid Address';
    } else
      return null;
  }

  String watercropValidator(value) {
    if (value.isEmpty) {
      return 'Please enter valid information';
    } else
      return null;
  }

  String feedbackValidator(value) {
    if (value.isEmpty) {
      return 'Please give your Feedback!';
    } else
      return null;
  }

  String emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter a Email ID';
    } else if (value.toString().contains('@') &&
        value.toString().contains('.')) {
      return null;
    } else
      return 'Please enter a valid Email ID';
  }

  String contactValidator(value) {
    if (value.isEmpty) {
      return 'Please enter a valid contact number';
    }
    final n = num.tryParse(value);
    if (n == null) {
      return 'Enter a valid contact number';
    } else if (n > 9999999999 || n < 1000000000) {
      return 'Enter a valid 10 digit number';
    } else
      return null;
  }

  TextFormField fields(
      {String decorationText,
      TextEditingController controllername,
      Function validateFunction,
      List<TextInputFormatter> numFormatter,
      int maxlines,
      int maxlen,
      TextInputType keyboard,
      String compulsory}) {
    return TextFormField(
      maxLines: maxlines,
      maxLength: maxlen,
      controller: controllername,
      decoration: InputDecoration(
          labelText: compulsory + decorationText,
          border: OutlineInputBorder(),
          hintText: 'Enter your $decorationText'),
      cursorWidth: 2,
      inputFormatters: numFormatter,
      keyboardType: keyboard,
      validator: validateFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Feedback"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                          decorationText: "Name",
                          controllername: _name,
                          validateFunction: nameValidator,
                          compulsory: "*"),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                        keyboard: TextInputType.number,
                        decorationText: "Contact Number",
                        controllername: _contactNumber,
                        validateFunction: contactValidator,
                        numFormatter: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                        compulsory: "*",
                        maxlen: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                          decorationText: "Email ID",
                          controllername: _email,
                          validateFunction: emailValidator,
                          compulsory: "*"),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                        decorationText: "Address",
                        controllername: _address,
                        validateFunction: addressValidator,
                        compulsory: "*",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                        decorationText:
                            "what was the ground water level before excavation?",
                        controllername: waterexcbef,
                        validateFunction: watercropValidator,
                        compulsory: "*",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                        decorationText:
                            "What is the ground water level after excavation?",
                        controllername: waterexcaft,
                        validateFunction: watercropValidator,
                        compulsory: "*",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                        decorationText: "What was the crop production before?",
                        controllername: cropprodbef,
                        validateFunction: watercropValidator,
                        compulsory: "*",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                        decorationText: "What was the crop production after?",
                        controllername: cropprodaft,
                        validateFunction: watercropValidator,
                        compulsory: "*",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                          decorationText: "Feedback",
                          controllername: _feedback,
                          validateFunction: feedbackValidator,
                          maxlen: 300,
                          maxlines: 5,
                          compulsory: "*"),
                      SizedBox(
                        height: 20,
                      ),
                      fields(
                          controllername: _suggestions,
                          // validateFunction: textValidator,
                          decorationText: "Suggestions",
                          maxlen: 300,
                          maxlines: 5,
                          compulsory: ""),
                      SizedBox(
                        height: 20,
                      ),
                      Builder(
                        builder: (BuildContext context) => Container(
                          child: RaisedButton.icon(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              icon: Icon(Icons.comment),
                              label: Text('Submit'),
                              color: Colors.blue,
                              colorBrightness: Brightness.light,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  try {
                                    await submitLocalFeedback();
                                    _name.clear();
                                    _contactNumber.clear();
                                    _email.clear();
                                    _feedback.clear();
                                    _suggestions.clear();
                                    _ratings.clear();
                                    _address.clear();
                                    waterexcbef.clear();
                                    waterexcaft.clear();
                                    cropprodbef.clear();
                                    cropprodaft.clear();
                                    _showMyDialog();
                                  } catch (error) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("Something went wrong")));
                                    return 'OOPS there was an error!';
                                  }
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StatisticsPage()));
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Please fill the details properly"),
                                    duration: Duration(seconds: 1),
                                  ));
                                  return 'Enter the fields properly';
                                }
                              }),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
