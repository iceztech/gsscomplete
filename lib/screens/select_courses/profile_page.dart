import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:gsscomplete/utils/constants/general_constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 240.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      title: Text(
                        "Chibueze",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      background: Image.asset(
                        "assets/images/profile.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
              ];
            },
            body: _profileBody()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Gallery',
          child: Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  Widget _profileBody() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              child: ListTile(
            title: Text('08032443423'),
            subtitle: Text(
              'Phone Number',
              style: TextStyle(color: kSecondaryColor),
            ),
          )),
          Divider(
            height: 0,
            color: kBlackColor.withOpacity(0.6),
          ),
          Container(
              child: ListTile(
            title: Text('Engineering'),
            subtitle: Text('Faculty', style: TextStyle(color: kSecondaryColor)),
          )),
          Divider(
            height: 0,
            color: kBlackColor.withOpacity(0.6),
          ),
          Container(
              child: ListTile(
            title: Text('Electronic and Computer Engineering'),
            subtitle:
                Text('Department', style: TextStyle(color: kSecondaryColor)),
          )),
          Divider(
            height: 0,
            color: kBlackColor.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
