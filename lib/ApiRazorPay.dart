import 'dart:convert';
import 'dart:ffi';
import 'package:AOL_localfeedback/OrderApi.dart';
import 'package:AOL_localfeedback/SuccesPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ApiRazorPay extends StatefulWidget {
  @override
  _ApiRazorPayState createState() => _ApiRazorPayState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String amount;
double amt;
String idd;
String paymentId;
bool _autoValidate = false;
String _email;
String _mobile;
bool greaterthan10000 = false;
String selectedProject;

final TextEditingController _emailController = TextEditingController();
final TextEditingController _numberController = TextEditingController();
final TextEditingController _amountController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _pancardController = TextEditingController();
final TextEditingController _mynameController = TextEditingController()
  ..text = "Anonymous";
DropdownMenuItem abc = DropdownMenuItem(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('\nAny Project'),
      Text('   '),
      Divider(
        thickness: 2,
        color: Colors.grey[300],
      ),
    ],
  ),
  value: "Any Project",
);

Future<OrderApi> createOrder(String amount, String id,
    {String currency = "INR", String receipt = "receipt"}) async {
  final String apiUrls = "https://api.razorpay.com/v1/orders";
//  Map<String,String> myHeaders = new Map<String,String>();
  Map<String, String> myHeaders = {
//    "Content-Type": "application/json",
    "Authorization":
        "Basic cnpwX3Rlc3RfNzg1aXVIaEV3dGhPY2k6YUdFWmxvQ2hlbzR5NjhEMjhlYkxvMXha",
  };

  final response = await http.post(apiUrls, headers: myHeaders, body: {
    "amount": (num.parse(amount) * 100).toString(),
    "currency": currency,
    "receipt": receipt,
  });
  final String responseString = response.body;

  id = responseString.substring(7, 27);
  Map responsejson = jsonDecode(response.body.toString());
  idd = responsejson["id"];
  amt = responsejson["amount"] / 100;
  return orderApiFromJson(responseString);
}

class _ApiRazorPayState extends State<ApiRazorPay> {
//  DropdownButton ddButton = DropdownButton(items: null, onChanged: null);
  static const platform = const MethodChannel("razorpay_flutter");
  bool valuefirst = false;
  Razorpay _razorpay1;
  final databaseReference = FirebaseDatabase.instance.reference();

  List<DropdownMenuItem> projectsDropdwnItems = [];

  Future<void> getProjectsData() async {
    databaseReference
        .child("projects")
        .once()
        .then((DataSnapshot dataSnapshot) {
      Map projMap = dataSnapshot.value;
      projectsDropdwnItems.add(abc);
      projMap.values.toList().forEach((result) {
        setState(() {
          Map resultMap = result;

          if(selectedProject!=result){
          projectsDropdwnItems.add(
            DropdownMenuItem(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(result['projectName']),
                  Text(
                    result['siteAddress'],
                    style: TextStyle(color: Colors.grey),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                ],
              ),
              value: result['projectName'],

            ),

          );}
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              toolbarHeight: 70,
              collapsedHeight: 90,
              //collapsedHeight: 100,
              backgroundColor: Colors.transparent,
              expandedHeight: 300,
              floating: true,
              pinned: false,
              // AppBar will get scrolled.
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45)),
                  child: Image.asset(
                    "image/test.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                titlePadding: EdgeInsets.fromLTRB(80, 0, 0, 35),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {

                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        "The happiest person is a giver",
                        style: TextStyle(
                            fontFamily: 'DancingScript',
                            fontSize: 31,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            valuefirst
                                ? TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: _mynameController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xff02b9f3),
                                          ),
                                        ),
                                        labelText: 'Name',
                                        hintText: 'Name'),
                                    enabled: false,
                                  )
                                : TextFormField(
                                    keyboardType: TextInputType.name,
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xff02b9f3),
                                          ),
                                        ),
                                        labelText: 'Name',
                                        hintText: 'Name'),
                                    validator: (String arg) {
                                      if (arg.length < 3)
                                        return 'Name must be more than 2 character';
                                      else if (arg.length > 20) {
                                        return 'Characters exceeded Max.20 Allowed ';
                                      } else
                                        return null;
                                    },
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  checkColor: Colors.black,
                                  value: this.valuefirst,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuefirst = value;
                                    });
                                  },
                                ),
                                Text("Be Anonymous")
                              ],
                            ),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff02b9f3),
                                    ),
                                  ),
                                  labelText: 'Email',
                                  hintText: 'Email'),
                              validator: validateEmail,
                              onSaved: (String val) {
                                _email = val;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _numberController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff02b9f3),
                                    ),
                                  ),
                                  labelText: 'Phone number',
                                  hintText: 'Phone number'),
                              keyboardType: TextInputType.phone,
                              validator: validateMobile,
                              onSaved: (String val) {
                                _mobile = val;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _amountController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff02b9f3),
                                    ),
                                  ),
                                  labelText: 'Amount',
                                  hintText: 'Limit upto 25000'),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                if (num.parse(value) >= 10000) {
                                  setState(() {
                                    greaterthan10000 = true;
                                  });
                                } else {
                                  setState(() {
                                    greaterthan10000 = false;
                                  });
                                }
                              },
                              validator: (String value) {
                                if (value.isEmpty || num.parse(value) > 25000) {
                                  return 'Enter amount Min ₹.1 to Max ₹.25000';
                                } else {
                                  amount = value;
                                  return null;
                                }
                              },
                            ),
                            greaterthan10000
                                ? TextFormField(
                                    validator: validatePAN,
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    controller: _pancardController,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xff02b9f3),
                                          ),
                                        ),
                                        labelText: 'Pan Card Number',
                                        hintText: 'Pan Card Number'),
                                  )
                                : Text(""),
                            Container(
                              child: DropdownButtonFormField(

                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff02b9f3),
                                    ),
                                  ),
                                ),
                                items: projectsDropdwnItems,
                                onChanged: (selectedAccountType) {
                                  setState(() {
                                    selectedProject = selectedAccountType;
                                    debugPrint(selectedProject);
                                  });
                                },
                                validator: (value) =>
                                    value == null ? 'field required' : null,
                                onSaved: (value){
                                  projectsDropdwnItems.clear();
                                },
                                value: selectedProject,
                                isDense: false,
                                isExpanded: true,
                                hint: Text(
                                  'Select Projects',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                      RaisedButton(
                        elevation: 3,
                        color: Color(0xff02b9f3),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(20),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Donate Now",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                color: Color(0xffe2f3fb)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            try {
                              final OrderApi order =
                              await createOrder('$amount', idd);
                              openCheckout();
//                              _nameController.clear();
//                              _mynameController.clear();
//                              _emailController.clear();
//                              _amountController.clear();
//                              _numberController.clear();
//                              _pancardController.clear();
//                              _formKey.currentState.reset();
                            } catch (error) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Something went wrong")));
                              return 'OOPS there was an error!';
                            }
                          } else {
                            setState(() {
                              _autoValidate = true;
                            });
                          }
                          //openCheckout();
                        },
                      ),
                    ],
                  ),
                );
              }, childCount: 1),
            ),
          ],
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePAN(String value) {
    Pattern pattern = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter correct Pan Card number.';
    else
      return null;
  }

  String validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  @override
  void initState() {
    _nameController.clear();
    _mynameController.clear();
    _emailController.clear();
    _amountController.clear();
    _numberController.clear();
    _pancardController.clear();
    projectsDropdwnItems.clear();
    super.initState();
    getProjectsData();
    _razorpay1 = Razorpay();
    _razorpay1.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay1.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay1.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay1.clear();
  }

  void openCheckout() async {
    _formKey.currentState?.reset();
    var options = {
      "order_id": idd,
      'key': 'rzp_test_785iuHhEwthOci',
      'name': 'IAHV',
      'description': 'Watershed Management Project',
      'prefill': {
        'contact': num.parse(_numberController.text),
        'email': _emailController.text.toString()
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay1.open(options);
    } catch (e) {}
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
    paymentId = response.paymentId.toString();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SuccessPage(
                idd,                paymentId,
                amt,
                valuefirst
                    ? _mynameController.text.toString()
                    : _nameController.text.toString(),
                _emailController.text.toString(),
                _numberController.text.toString(),
                greaterthan10000 ? _pancardController.text.toString() : 'null',
                selectedProject)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
}
