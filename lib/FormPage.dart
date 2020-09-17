import 'package:AOL_localfeedback/ProjectPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  TextEditingController _contactNumber = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _Amountcontroller = TextEditingController();

  Razorpay _razorpay;
  void initState() {
    _razorpay = Razorpay();
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 70,
            collapsedHeight: 90,
            //collapsedHeight: 100,
            backgroundColor: Colors.transparent,
            expandedHeight: 300,
            floating: true,
            pinned: true,
            // AppBar will get scrolled.
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45), bottomRight: Radius.circular(45)),
                child: Image.asset("image/test.jpg",fit: BoxFit.fill,),
              ),
              titlePadding: EdgeInsets.fromLTRB(80, 0, 0, 35),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) {
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
                        TextFormField(
                          validator: emailValidator,
                          controller: _email,
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _contactNumber,
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Phone Number",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: _Amountcontroller,
                          style: TextStyle(fontSize: 20.0),
                          decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Amount",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xFFf45d27),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () {
                              openCheckout();
                            },
                            child: Text("Donate Now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,

                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1
            ),
          ),
        ],
      ),
    );
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

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_gOZLxZMO8J2ap7',
      'amount': (double.parse(_Amountcontroller.text)*100.roundToDouble()).toString(),
      'name': 'Art Of Living',
      'description': 'Watershed Management Project',
      'prefill': {'email':_email.text, 'contact': num.parse(_contactNumber.text)},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }
  String success='';

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
    //Navigator.push(context, MaterialPageRoute(builder: (context)=> ProjectPage()));
    success=response.paymentId.toString();
    print("                                                                                               "+success);
    debugPrint("******fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"+response.orderId.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
    success=response.code.toString();
    print("                                                                                               "+success);
    debugPrint("******f*********************************************************"+response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }

}
