import 'package:flutter/material.dart';
import 'package:rewahub/blocs/bloc-provider.dart';
import 'package:rewahub/blocs/user-bloc.dart';
import 'package:rewahub/models/user.dart';
import 'package:rewahub/services/auth.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Center(
        child: StreamBuilder<UserModel>(
          initialData: userBloc.user,
          stream: userBloc.stream,
          builder: (ctx, snap) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snap.data.username),
              Text(snap.data.email),
              Image.network(snap.data.imageUrl??'',),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text('LOGOUT'),
                onPressed: AuthService().handleSignOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
