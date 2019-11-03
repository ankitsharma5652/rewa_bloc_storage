import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rewahub/services/auth.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/cust_reg_page.dart';
import 'package:rewahub/views/main_page.dart';
import 'package:rewahub/views/pin_entry.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new LogInPages(),
    );
  }
}

class LogInPages extends StatefulWidget {
  UserRepository userRepo ;

  LogInPages({Key key}) : super(key: key){

    userRepo = UserRepository();
  }

  // LogInPages({Key key}) : super(key: key);
  @override
  _LogInPageState createState() => new _LogInPageState();
}

class _LogInPageState extends State<LogInPages> {
  final AuthService auth = AuthService();
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  var email = TextEditingController();
  var pswd = TextEditingController();
  final FocusNode fnThree = FocusNode();
  final FocusNode fnFour = FocusNode();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFf5f5f5),
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              new Container(
                height: MediaQuery.of(context).size.height / 3,
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/rewahub_icon.png',
                        height: 55.0,
                      ),
                      Text(
                        "Login to your Application for winning",
                        style: TextStyle(
                          color: Colors.white70,
                          //fontSize: 15.0,
                        ),
                      ),
                      Text(
                        "surprise Rewards",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15.0,
                        ),
                      ),
                    ]),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.topLeft,
                    stops: [0.05, 0.3],
                    colors: [blushish, reddish],
                  ),
                ),
                alignment: Alignment.center,
                width: 1.7976931348623157e+308,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0.0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(15.0, 40.0, 10.0, 0.0),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            primaryColor: reddish,
                            cursorColor: reddish,
                          ),
                          child: TextFormField(
                            controller: email,
                            textInputAction: TextInputAction.next,
                            focusNode: fnThree,
                            onFieldSubmitted: (term) {
                              _fieldFocusChange(context, fnThree, fnFour);
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: reddish),
                              hintText: "Enter Your Email",
                            ),
                            autofocus: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15.0, 30.0, 10.0, 0.0),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                            primaryColor: reddish,
                            cursorColor: reddish,
                          ),
                          child: TextFormField(
                            obscureText: true,
                            controller: pswd,
                            textInputAction: TextInputAction.done,
                            focusNode: fnFour,
                            onFieldSubmitted: (value) {
                              fnFour.unfocus();
                            },
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: reddish),
                              hintText: "Enter Your Password",
                            ),
                            autofocus: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                        ),
                        new Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                    17.0) //         <--- border radius here
                                ),
                            gradient:
                                LinearGradient(colors: [blushish, reddish]),
                          ),
                          child: MaterialButton(
                            padding: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MainPage()),
                            //   );

                            //   _onClick();
                            // },
                            onPressed: (){

                              widget.userRepo.signInWithCredentials(email.text, pswd.text).then((val){

                                print(val.user.displayName);
                              });
                              print("login button pressed  "+ email.text +" "+ pswd.text);
                            },
                            child: Text(
                              "Log In",
                              textAlign: TextAlign.center,
                              style: h1TextBlack.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SocialIcon(
                              colors: [
                                Color(0xFF102397),
                                Color(0xFF187adf),
                                Color(0xFF00eaf8),
                              ],
                              iconData: FontAwesomeIcons.facebookF,
                              onPressed: () {},
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFFff4f38),
                                Color(0xFFff355d),
                              ],
                              iconData: FontAwesomeIcons.googlePlusG,
                              // onPressed: () {},
                              // onPressed: auth.handleGoogleSignin,
                               onPressed:  () async{
                              FirebaseUser user = await auth.handleGoogleSignin();


                              print(user);
                              }
                              
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFF00c6fb),
                                Color(0xFF005bea),
                              ],
                              iconData: FontAwesomeIcons.linkedinIn,
                              onPressed: () {},
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                        ),
                        new Text(
                          "Don't Have an account? ",
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 30.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CustRegPage()),
                              );
                            },
                            child: Text(
                              "SIGN UP NOW",
                              style: TextStyle(
                                color: Color(0XFFab2785),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void buttonPressed() {}

  void _onCancel() {}

  void _validCallback() {}

  void _onPasswordEntered(String text) {
    print("Entered password is $text");

    if (text == "1234")
      // Navigator.pop(context,text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    else {
      _verificationNotifier.add(false);
    }
    //    _verificationNotifier.add(event)
  }

  _onClick() async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PinEntry(
                  title: 'Enter Passcode',
                  cancelCallback: _onCancel,
                  deleteLocalizedText: 'Delete',
                  cancelLocalizedText: 'Cancel',
                  shouldTriggerVerification: _verificationNotifier.stream,
                  passwordEnteredCallback: _onPasswordEntered,
                  isValidCallback: _validCallback,
                )));

    print(result.runtimeType.toString());
    print("result is $result");
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

// }
