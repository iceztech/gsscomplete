import 'dart:convert';
import 'dart:io';

import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:gsscomplete/data/services/api_service.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';
import 'package:monnify_flutter_sdk/monnify_flutter_sdk.dart' as a;
import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentOptionPage extends StatefulWidget {
  final double amount;

  const PaymentOptionPage({Key? key, required this.amount}) : super(key: key);
  @override
  _PaymentOptionPageState createState() => _PaymentOptionPageState();
}

class _PaymentOptionPageState extends State<PaymentOptionPage> {
  bool _hasTransactionStarted = false;
  late String email = 'agbo.raph123@gmail.com';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var publicKey = 'pk_test_9a1befcef6741639660d3028bb8414b2216c8f04';
  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    //initializing Monnify Api
    initializeSdk();
    //initializing Paystack Api
    plugin.initialize(publicKey: publicKey);
  }

  //Monnify Functions
  Future<void> initializeSdk() async {
    try {
      if (await a.MonnifyFlutterSdk.initialize(
          'MK_TEST_R4AA65S34T', '4473431289', a.ApplicationMode.TEST)) {}
    } on PlatformException catch (e, s) {}
  }

  Future<void> initPayment() async {
    a.TransactionResponse transactionResponse;

    try {
      transactionResponse =
          await a.MonnifyFlutterSdk.initializePayment(a.Transaction(
        widget.amount,
        "NGN",
        "Customer Name",
        email,
        getRandomString(15),
        "Cash Deposit to Iceztech",
        metaData: {"ip": "196.168.45.22", "device": "mobile"},
        paymentMethods: [
          a.PaymentMethod.CARD,
          a.PaymentMethod.ACCOUNT_TRANSFER
        ],
      ));
      if (transactionResponse.transactionStatus.toLowerCase() == 'paid') {
        //todo
      } else {
        //todo
      }
    } on PlatformException catch (e, s) {
      print("Error initializing payment");
      print(e);
      print(s);
    }
  }

  String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  //Functions for Paystack
  _startCharge() async {
    setState(() {
      _hasTransactionStarted = !_hasTransactionStarted;
    });
    var values = await APIService.initTransaction(
        'sk_test_5031aae886b430022c410efb43b64b6f3f1a764d',
        widget.amount.toString() + '00',
        'agbo.raph123@gmail.com');

    Charge _charge = Charge()
      ..email = 'agbo.raph123@gmail.com'
      ..amount = 1000
      ..accessCode = values['data']['access_code'];

    CheckoutResponse _checkoutResponse = await plugin.checkout(
      context,
      charge: _charge,
      method: CheckoutMethod.selectable,
    );

    if (_checkoutResponse.status == true) {
      print(_checkoutResponse.reference);
      //todo
    } else {}
    setState(() {
      _hasTransactionStarted = !_hasTransactionStarted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title:
                  Text('Select Payment', style: TextStyle(color: Colors.white)),
            ),
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Choose how to pay with your Card.',
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      initPayment();
                    },
                    child: Container(
                        height: 70,
                        color: Colors.white,
                        child: Card(
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/monnify.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                color: kPrimaryColor,
                                height: 70,
                                width: 0.5,
                              ),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Instant payment with Monnify',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14)),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      _startCharge();
                    },
                    child: Container(
                        height: 70,
                        child: Card(
                          elevation: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/paystackl.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                color: kPrimaryColor,
                                height: 70,
                                width: 0.5,
                              ),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Instant payment with Paystack',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14)),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              )),
            ))
      ],
    );
  }
}
