import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/widgets/bottomsheet/bottomsheet.dart';
import 'package:gsscomplete/models/static_data/activation_category_data.dart';
import 'package:gsscomplete/models/static_data/home_data.dart';
import 'package:gsscomplete/screens/activation/activation_page.dart';
import 'package:gsscomplete/screens/feedback/feedback_page.dart';
import 'package:gsscomplete/screens/registration/registration_page.dart';
import 'package:gsscomplete/utils/constants/general_constants.dart';
import 'package:gsscomplete/utils/constants/navigator/navigation_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeMenu> menu = [];
  late Animation<Offset> animation;
  late AnimationController animationController;
  bool loading = true;
  bool loading1 = false;

  // Default Radio Button Item
  String radioItem = 'Session (NGN 800)';

  // Group Value for Radio Button.
  int id = 1;
  List<Activation> activate = ActivationData.activate;

  @override
  void initState() {
    super.initState();

    menu = HomeData.homeData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    60.0,
                  )),
                  color: kPrimaryColor),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Visibility(
                        visible: loading,
                        child: Align(
                          alignment: Alignment.center,
                          child: IgnorePointer(
                            ignoring: !loading,
                            child: AnimatedOpacity(
                              opacity: loading ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      'Unizik GSS Complete',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Visibility(
                                      visible: false,
                                      child: Text(
                                        'Welcome',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/images/unizik.jpg',
                                            height: 40,
                                            width: 40,
                                          ),
                                        )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      height: 35,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        color: kTransparent,
                                        border: Border.all(
                                            width: 2.0, color: kTextWhiteColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            kopenPage(
                                                context, RegistrationPage());
                                          },
                                          child: Text(
                                            'Activate Now',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: _toggle,
                                      child: Text(
                                        'No Account? Activate Now',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: loading1,
                        child: Align(
                          alignment: Alignment.center,
                          child: IgnorePointer(
                            ignoring: !loading1,
                            child: AnimatedOpacity(
                              opacity: loading1 ? 1 : 0,
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                            width: 140,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Image.asset(
                                                'assets/images/unizik.jpg',
                                                height: 40,
                                                width: 40,
                                              ),
                                            )),
                                        Positioned(
                                          right: 110,
                                          child: GestureDetector(
                                              onTap: _toggle,
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: kSecondaryColor,
                                                    shape: BoxShape.circle),
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                  size: 17,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Sign in your account',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                        width: 175,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.0,
                                              color: kTextWhiteColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 2.0),
                                          child: TextField(
                                            maxLines: 1,
                                            maxLength: 11,
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                                counterText: '',
                                                border: InputBorder.none,
                                                hintText: 'Enter Phone Number',
                                                hintStyle: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                )),
                                          ),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 35,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: kTransparent,
                                        border: Border.all(
                                            width: 2.0, color: kTextWhiteColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'No Account? Activate Now',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 14,
                    left: 12,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          children: [
                            Text(
                              'Version',
                              style: TextStyle(
                                  color: kTextWhiteColor, fontSize: 12),
                            ),
                            Text(
                              '2021.0',
                              style: TextStyle(
                                  color: Colors.red.withOpacity(0.9),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    top: 50,
                    right: 12,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Image.asset('assets/images/star.png')),
                  ),
                  Positioned(
                    top: 50,
                    left: 12,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            buildShowBottomSheet(
                              context: context,
                              height: 200,
                              bottomsheetContent: _bottomSheetContent(),
                            );
                          },
                          child: Icon(
                            Icons.monetization_on,
                            color: Colors.green[900],
                            size: 30,
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        margin: EdgeInsets.only(top: 65),
                        child: Image.asset('assets/images/unizik.jpg'))),
                Container(
                    decoration: new BoxDecoration(
                      color: kTextWhiteColor.withOpacity(0.82),
                    ),
                    child: Container(
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0,
                                    childAspectRatio: 4.5 / 2,
                                    crossAxisCount: 2),
                            itemCount: menu.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                              bottom: 28,
                            ),
                            itemBuilder: (BuildContext ctx, index) =>
                                GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      showInfoDialog(
                                          height: 200,
                                          widgets: dialogBodyActivation(),
                                          actionText: 'ACTIVATE NOW',
                                          onTap: () {
                                            showInfoDialog(
                                                height: 380,
                                                widgets: dialogBodyCategory(),
                                                actionText: 'CONTINUE',
                                                onTap: () {
                                                  kopenPage(context,
                                                      RegistrationPage());
                                                });
                                          });
                                    } else if (index == 5) {
                                      kopenPage(context, FeedBackPage());
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                          color: kPrimaryLighterColor
                                              .withOpacity(0.5),
                                          width: 1),
                                      right: BorderSide(
                                          color: (index == 0 ||
                                                  index == 2 ||
                                                  index == 4 ||
                                                  index == 6)
                                              ? kPrimaryLighterColor
                                                  .withOpacity(0.5)
                                              : Colors.transparent,
                                          width: 1),
                                    )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 38,
                                            height: 38,
                                            decoration: BoxDecoration(
                                                color: menu[index].color,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              menu[index].icon,
                                              color: Colors.white,
                                              size: 18,
                                            )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          menu[index].title,
                                          style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _toggle() {
    setState(() {
      if (loading) {
        loading = false;
        loading1 = true;
      } else {
        loading = true;
        loading1 = false;
      }
    });
  }

  showInfoDialog(
      {required double height,
      required Widget widgets,
      required String actionText,
      required Function onTap}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 25.0,
            contentPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Stack(
                children: [
                  Container(
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgets,
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Text('CANCEL',
                                    style: TextStyle(
                                        color: kSecondaryColor, fontSize: 15)),
                              ),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  onTap();
                                },
                                child: Text(actionText,
                                    style: TextStyle(
                                        color: kSecondaryColor, fontSize: 15)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        });
  }

  Widget dialogBodyActivation() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Text('Activation Alert!',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(
              height: 20,
            ),
            Text('To have access to this section,\nApp must be activated.',
                style: TextStyle(color: Colors.black, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget dialogBodyCategory() {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 15,
            ),
            Text('Select Category',
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: activate.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    title: Text("${activate[index].name}"),
                    groupValue: id,
                    value: activate[index].index,
                    onChanged: (val) {
                      setState(() {
                        radioItem = activate[index].name;
                        id = activate[index].index;
                      });
                    },
                  );
                })
          ])),
    );
  }

  _bottomSheetContent() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Icon(
                  Icons.monetization_on,
                  color: Colors.green[900],
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Market with us!',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                'Become a reseller of GSS Complete\nActivation Code',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text('NO THANKS',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 14,
                        )),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      width: 90,
                      color: kPrimaryColor,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Text('CALL US NOW',
                            style: TextStyle(
                              color: kTextWhiteColor,
                              fontSize: 12,
                            )),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
