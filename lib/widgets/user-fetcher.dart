import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rewahub/blocs/user-bloc.dart';
import 'package:rewahub/models/user.dart';
import 'package:rewahub/pages/dashboard.dart';

class UserFetcher extends StatefulWidget {
  final UserBloc userBloc;

  UserFetcher(this.userBloc);

  @override
  _UserFetcherState createState() => new _UserFetcherState();
}

class _UserFetcherState extends State<UserFetcher> {
  initState() {
    super.initState();
    Firestore.instance
        .collection('users')
        .document(widget.userBloc.user.id)
        .snapshots()
        .listen((userDoc) {
      var user = UserModel.fromMap(userDoc.data..addAll({'id': userDoc.documentID}));
      widget.userBloc.setUser(user);
    });
  }

  @override
  Widget build(BuildContext context) => Dashboard();
}
