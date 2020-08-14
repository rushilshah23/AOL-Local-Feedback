import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      'feedback': _feedback.text,
      'suggestions': _suggestions.text,
    });
  }

  void clearControllers() {
    _name.clear();
    _contactNumber.clear();
    _email.clear();
    _feedback.clear();
    _suggestions.clear();
    _ratings.clear();
  }

  String textValidator(value) {
    if (value.isEmpty) {
      return 'Please enter a valid Name';
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

  // String countryCodeValidator(value) {
  //   if (value.isEmpty) {
  //     return 'Please enter a valid contact number';
  //   }
  //   final n = num.tryParse(value);
  //   if (n == null) {
  //     return 'Enter a valid Country code';
  //   } else if (n > 999999999 || n < 1000000000) {
  //     return 'Enter a valid 10 digit number';
  //   } else
  //     return null;
  // }

  TextFormField fields({
    String decorationText,
    TextEditingController controllername,
    Function validateFunction,
    List<TextInputFormatter> numFormatter,
    int maxlines,
    int maxlen,
    TextInputType keyboard,
  }) {
    return TextFormField(
      maxLines: maxlines,
      maxLength: maxlen,
      // key: _formKey,
      controller: controllername,
      decoration: InputDecoration(
          labelText: decorationText,
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
        margin: EdgeInsets.all(32),
        child: ListView(
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    fields(
                        decorationText: "Name",
                        controllername: _name,
                        validateFunction: textValidator),
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
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    fields(
                        decorationText: "Email ID",
                        controllername: _email,
                        validateFunction: emailValidator),
                    SizedBox(
                      height: 20,
                    ),
                    fields(
                      decorationText: "Feedback",
                      controllername: _feedback,
                      validateFunction: textValidator,
                      maxlen: 300,
                      maxlines: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    fields(
                      controllername: _suggestions,
                      validateFunction: textValidator,
                      decorationText: "Suggestions",
                      maxlen: 300,
                      maxlines: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Builder(
                      builder: (BuildContext context) => RaisedButton(
                          child: Text('Submit'),
                          color: Colors.blue,
                          colorBrightness: Brightness.light,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              try {
                                submitLocalFeedback();

                                _name.clear();
                                _contactNumber.clear();
                                _email.clear();
                                _feedback.clear();
                                _suggestions.clear();
                                _ratings.clear();

                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Feedback recorded")));
                              } catch (error) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Details Validated")));
                                return 'OOPS there was an error!';
                              }
                              return null;
                            } else
                              return 'Enter the fields properly';
                          }),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
