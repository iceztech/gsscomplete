import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivationPageInfo extends StatefulWidget {
  const ActivationPageInfo({Key? key}) : super(key: key);

  @override
  _ActivationPageInfoState createState() => _ActivationPageInfoState();
}

class _ActivationPageInfoState extends State<ActivationPageInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Get Activation Code',
          style: kHeadingextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'ACTIVATION CODE  can be purchase at\nour office: ',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'IcezTech - Unizik School Gate,\nBehind Security Office,Ifite -\nAwka, Anambra State ',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'You can also purchase it from any of\nour reseller in your faculty',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'OR click to call any of the numbers\nbelow',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchPhoneDialer('+2348144913078');
                      },
                      child: Text(
                        '+2348144913078',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchPhoneDialer('+2348130256602');
                      },
                      child: Text(
                        '+2348130256602',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        launchPhoneDialer('+23409083184940');
                      },
                      child: Text(
                        '+23409083184940',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Remember that you can also make\npayment with your ATM card by clicking\non',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "'MAKE SECURE PAYMENT WITH YOUR\nCARD'",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'on the activation screen',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Image.asset('assets/images/paystack.png'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      throw ("Cannot dial");
    }
  }
}
