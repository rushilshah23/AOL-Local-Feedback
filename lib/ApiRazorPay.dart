import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:AOL_localfeedback/ProjectPage.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ApiRazorPay extends StatefulWidget {
  @override
  _ApiRazorPayState createState() => _ApiRazorPayState();
}

class _ApiRazorPayState extends State<ApiRazorPay> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Razorpay Sample App'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: openCheckout, child: Text('Open'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);

    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      "razorpay_payment_id": "pay_29QQoUBi66xm2f",
      "razorpay_order_id": "order_9A33XWu170gUtm",
      "razorpay_signature":
          "9ef4dffbfd84f1318f6739a3ce19f9d85851857ae648f114332d8401e0949a3d",
      'key': 'rzp_test_gOZLxZMO8J2ap7',
      'amount': 1000000,
      'name': 'Art Of Living',
      'description': 'Watershed Management Project',
      'prefill': {'contact': '', 'email': ''},
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

  String success = '';

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, timeInSecForIosWeb: 4);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ProjectPage()));
    success = response.paymentId.toString();
    print(
        "                                         Payment ID                                                      " +
            success);
    print(
        "                                         OrderID                                                           " +
            response.orderId.toString());
    print(
        "                                        Signature                                                           " +
            response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        timeInSecForIosWeb: 4);
    success = response.code.toString();
    print(
        "                                                                                               " +
            success);
    debugPrint(
        "******f*********************************************************" +
            response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName, timeInSecForIosWeb: 4);
  }
}
