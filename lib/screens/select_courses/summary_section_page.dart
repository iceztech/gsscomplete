import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsscomplete/commons/components/summary_item.dart';
import 'package:gsscomplete/models/static_data/slider.dart';

import 'package:gsscomplete/utils/constants/general_constants.dart';

class SummarySection extends StatefulWidget {
  const SummarySection({Key? key}) : super(key: key);

  @override
  _SummarySectionState createState() => _SummarySectionState();
}

class _SummarySectionState extends State<SummarySection> {
  int _currentPage = 0;
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  Color color = kPrimaryColor;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool inFinalPage() {
      if (_currentPage == Sliders.sliderArrayList.length - 1) {
        return true;
      }
      return false;
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text('GSS 101 Summary', style: TextStyle(color: Colors.white)),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: [
            Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ],
        ),
        drawer: _buildDrawer(context),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: Sliders.sliderArrayList.length,
                itemBuilder: (ctx, i) {
                  return SummaryItem(i);
                },
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (_currentPage == 0)
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: _circularIcon(
                                  bgcolor: kSecondaryColor,
                                  height: 60,
                                  icon: Icons.arrow_back_ios,
                                  width: 60,
                                  title: '',
                                  borderColor: Colors.white,
                                  txtcolor: kSecondaryColor),
                            ),
                      inFinalPage()
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: _circularIcon(
                                  bgcolor: kSecondaryColor,
                                  height: 60,
                                  icon: Icons.arrow_forward_ios,
                                  width: 60,
                                  title: '',
                                  borderColor: Colors.white,
                                  txtcolor: kSecondaryColor)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _circularIcon({
    required double height,
    required double width,
    required IconData icon,
    required Color bgcolor,
    required Color txtcolor,
    required Color borderColor,
    required String title,
  }) {
    return Column(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgcolor,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 3,
        )
      ],
    );
  }

  _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: [BoxShadow(color: Colors.black45)]),
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: kSecondaryColor, width: 3),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/bc.jpg'),
                      fit: BoxFit.cover),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: kTextWhiteColor, width: 3),
                            image: DecorationImage(
                                image: AssetImage('assets/images/gss105.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Gss 101',
                          style: TextStyle(color: kTextWhiteColor),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Use of English I',
                          style:
                              TextStyle(color: kTextWhiteColor, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.grid_on_outlined,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Introduction',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.grid_on_outlined,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Chapter One',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.grid_on_outlined,
                      color: Colors.black45,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Chapter Two',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
