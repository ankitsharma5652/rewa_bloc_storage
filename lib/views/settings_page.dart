import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rewahub/services/auth.dart';
import 'package:rewahub/ui/styles/styles.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: new AppBar(
            centerTitle: true,
            bottom: new PreferredSize(
              child: Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Padding(padding: EdgeInsets.only(bottom: 55,),),

                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'SETTINGS',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),

              //  )
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [blushish, reddish],
                ),
              ),
            ),
          ),
        ),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return Container(
    padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    margin: EdgeInsets.symmetric(vertical: 6.0),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      border: Border.all(color: Colors.white),
    ),

    child: new ListView(
      //  padding: new EdgeInsetsDirectional.only(start: 0.0, end: 0.0),

      children: ListTile.divideTiles(
        color: Colors.black,
        context: context,
        tiles: [
          new ListTile(
            leading: Icon(Icons.person_outline),
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            dense: false,
            onTap: () {
              print('Profile');
            },
          ),

          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            leading: Icon(Icons.notifications_active),
            title: Text(
              'Notifications',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            dense: false,
            onTap: () {
              print('Notifications');
            },
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            leading: Icon(
              Icons.business_center,
            ),
            title: Text(
              'Payment Settings',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            dense: false,
            onTap: () {
              print('Payment Settings');
            },
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            leading: Icon(Icons.business_center),
            title: Text(
              'Event Planning',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            dense: false,
            onTap: () {
              print('Event');
            },
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            leading: Icon(
              Icons.business_center,
            ),
            title: Text(
              'Manage Vouchers',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            dense: false,
            onTap: () {
              print('Manage');
            },
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            leading: Icon(
              Icons.security,
            ),
            title: Text(
              'Security',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
            dense: false,
            onTap: () {
              print('Security');
            },
          ),
          // SizedBox(
          //   height: 45,

          // ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Container(
              margin: new EdgeInsets.symmetric(horizontal: 85.0),
              decoration: BoxDecoration(
                border: Border.all(width: 0.0),
                borderRadius: BorderRadius.all(
                    Radius.circular(25.0) //         <--- border radius here
                    ),
                color: Colors.pink[600],
              ),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                // ------ button-----//
                onPressed: AuthService().handleSignOut,
                // onPressed:
                // () {
                // var snackbar = SnackBar(
                //   content: Text('logged out',
                //       style: TextStyle(color: Colors.white)),
                //   backgroundColor: reddish,
                //   action: SnackBarAction(
                //     textColor: Colors.limeAccent,
                //     label: 'Dismiss',
                //     onPressed: () {
                //       Scaffold.of(context).hideCurrentSnackBar();
                //     },
                //   ),
                // );
                // Scaffold.of(context).showSnackBar(snackbar);
                // },

                child: Text(
                  "Logout",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ).toList(),
    ),

    //  ),
  );
}
