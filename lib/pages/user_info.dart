//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//
//class UserInfo extends StatefulWidget {
//  @override
//  _UserInfoState createState() => _UserInfoState();
//}
//
//class _UserInfoState extends State<UserInfo> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: StreamBuilder(
//          stream: Firestore.instance.collection('users').snapshots(),
//          builder: (context, snapshot) {
//            if (!snapshot.hasData) return const Text('Loading...');
//            return Column(
//                children: <Widget>[
//                  Text(snapshot.data.documents[0]['username']),
//                  Text(snapshot.data.documents[0]['country']),
//                ],
//            );
//          }
//        ),
//    );
//  }
//}