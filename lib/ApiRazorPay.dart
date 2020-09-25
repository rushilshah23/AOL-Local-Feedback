import 'dart:convert';
import 'package:AOL_localfeedback/OrderApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:AOL_localfeedback/ProjectPage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class ApiRazorPay extends StatefulWidget {
  @override
  _ApiRazorPayState createState() => _ApiRazorPayState();
}
String idd;
Future<OrderApi> createOrder(String amount,String id,{String currency = "INR", String receipt = "receipt"}) async {
  final String apiUrls = "https://api.razorpay.com/v1/orders";
//  Map<String,String> myHeaders = new Map<String,String>();
  Map<String, String> myHeaders = {
//    "Content-Type": "application/json",
    "Authorization":
        "Basic cnpwX3Rlc3Rfc1dVUnFSUXlmUXpZbUg6QmhkM1pEbmx6elphV2R6UXJiNkpWWlRQ",
  };

  final response = await http.post(apiUrls, headers: myHeaders, body: {
    "amount": amount.toString(),
    "currency": currency,
    "receipt": receipt,
  });
  print("################################"+response.toString());
  final String responseString = response.body;

  id = responseString.substring(7, 27);
  print("respose is                                                "+responseString );
  Map responsejson = jsonDecode(response.body.toString());
  idd = responsejson["id"];
  //debugPrint();

//    for(int i=0;i<=2;i++){
//      print(responseString['id']);
//    }
//    print(responseString);
  return orderApiFromJson(responseString);
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
              RaisedButton(
                onPressed: () async {
                  final OrderApi order = await createOrder('100000',idd);
                  print(idd);
//                  print("order is      "+order.toString());
//                  print("xnw1ixi22nxi2" + order.toString());

                  openCheckout();
                },
                child: Text('Open'),
              )
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
//    String _id=id.substring(7,27);
    var options = {
      "order_id": idd,
      'key': 'rzp_test_sWURqRQyfQzYmH',
      'amount': 100000,
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
