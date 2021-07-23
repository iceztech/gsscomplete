import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/widgets/buttons/custom_button.dart';
import 'package:gsscomplete/screens/activation/activation_page.dart';
import 'package:gsscomplete/screens/payment_pages/payment_options_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Payment Method',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Select Payment Method Below',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            _buildPaymentOptions(
                iconData: Icons.card_travel,
                title: 'ATM Card',
                subtitle: 'Make payment using Bank ATM Card',
                onTap: () {
                  kopenPage(
                      context,
                      PaymentOptionPage(
                        amount: 1000.0,
                      ));
                }),
            _buildPaymentOptions(
                iconData: Icons.cast_sharp,
                title: 'Cash deposit / Transfer',
                subtitle:
                    'Make payment at bank branch or through bank transfer',
                onTap: () {}),
            _buildPaymentOptions(
                iconData: Icons.code,
                title: 'Activation Code',
                subtitle: 'Make payment using our activation code',
                onTap: () {
                  kopenPage(context, ActivationPage());
                }),
            _buildPaymentOptions(
                iconData: Icons.wallet_giftcard,
                title: "Users's Wallet",
                subtitle: "Make payment using another user's wallet",
                onTap: () {}),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                width: 100,
                height: 50,
                text: 'Need Help?',
                onPressed: () {
                  //kopenPage(context, PaymentPage());
                },
                borderRadius: 4,
                disableButton: true,
                margin: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOptions(
      {required IconData iconData,
      required String title,
      required subtitle,
      required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  iconData,
                  color: Colors.black,
                ),
              ),
              title: Text(
                title,
                style: TextStyle(fontSize: 13, color: kPrimaryColor),
              ),
              subtitle: Text(
                subtitle,
                style: TextStyle(fontSize: 11, color: Colors.black),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
