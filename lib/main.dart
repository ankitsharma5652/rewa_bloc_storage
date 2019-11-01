import 'package:flutter/material.dart';
import 'package:rewahub/blocs/bloc-provider.dart';
import 'package:rewahub/blocs/state-storage.dart';
import 'package:rewahub/blocs/user-bloc.dart';
import 'package:rewahub/models/user.dart';
import 'package:rewahub/services/auth.dart';
import 'package:rewahub/services/user-fetcher.dart';
import 'package:rewahub/views/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  StateStorage.prefs = await SharedPreferences.getInstance();

  final userBloc = UserBloc();
  runApp(App(userBloc));
}

class App extends StatefulWidget {
  final UserBloc userBloc;

  App(this.userBloc);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final AuthService _auth = AuthService();

  initState() {
    super.initState();
    _auth.state.listen((user) {
      if (user == null) {
        widget.userBloc.setUser(null);
      } else {
        _auth.handleUserLoggedIn(user).then((ref) {
          ref.get().then((userDoc) {
            var user = UserModel.fromMap(userDoc.data..addAll({'id': userDoc.documentID}));
            widget.userBloc.setUser(user);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      bloc: widget.userBloc,
      child: MaterialApp(
        // title: 'Flutter Boilerplate',
        home: StreamBuilder<UserModel>(
          stream: widget.userBloc.stream,
          builder: (ctx, snap) => snap.hasData ? UserFetcher(widget.userBloc) : LogInPage(),
        ),
      ),
    );
  }
}
