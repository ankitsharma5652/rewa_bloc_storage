import 'package:flutter/material.dart';
import 'package:rewahub/services/auth.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/cust_id_page.dart';

class CustRegPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style =
        TextStyle(fontFamily: 'Segoe UI', fontSize: 20.0, color: Colors.black);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: <Widget>[
            AspectRatio(
              aspectRatio: 2.5,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 60.0),
                      ),
                      Text(
                        "CREATE YOUR ACCOUNT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          //fontFamily: 'Segoe UI',
                          color: Colors.white,
                        ),
                      ),
                    ]),

                //flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [blushish, reddish],
                  ),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                child: CustRegPageForm(),
              ),
            )),
          ])),
    );
  }
}

// Create a Form widget.
class CustRegPageForm extends StatefulWidget {
  UserRepository userRepo;

  CustRegPageForm(){
    userRepo = UserRepository();
  }
  @override
  CustRegPageState createState() {
    return CustRegPageState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CustRegPageState extends State<CustRegPageForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<CustRegPageState>.
  // final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  var fname = TextEditingController();
  var lname = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();
  var phnumber = TextEditingController();
  final FocusNode fnOne = FocusNode();
  final FocusNode fnTwo = FocusNode();
  final FocusNode fnThree = FocusNode();
  final FocusNode fnFour = FocusNode();
  final FocusNode fnFive = FocusNode();

  @override
  Widget build(BuildContext context) {
    TextStyle style =
        TextStyle(fontFamily: 'Segoe UI', fontSize: 20.0, color: Colors.black);

    //Build a Form widget using the _formKey created above.

    return Form(
      // key: _formKey,
      child: Container(
        // color: Colors.black,
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 00.0),
        child: Container(
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, bottom: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: reddish,
                    cursorColor: reddish,
                  ),
                  child: TextFormField(
                    controller: fname,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: fnOne,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, fnOne, fnTwo);
                    },
                    style: style,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      fillColor: reddish,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: reddish),
                      hintText: "Enter Your First Name",
                    ),
                    autofocus: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: reddish,
                    cursorColor: reddish,
                  ),
                  child: TextFormField(
                    controller: lname,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: fnTwo,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, fnTwo, fnThree);
                    },
                    style: style,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                      labelText: 'LastName',
                      labelStyle: TextStyle(color: reddish),
                      hintText: "Enter Your Last Name",
                    ),
                    autofocus: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                    style: style,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: reddish),
                      hintText: "Enter Your Email",
                    ),
                    autofocus: true,
                    validator: validateEmail,
                    onSaved: (String value) {
                      var _email = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: reddish,
                    cursorColor: reddish,
                  ),
                  child: TextFormField(
                    obscureText: true,
                    controller: pass,
                    textInputAction: TextInputAction.next,
                    focusNode: fnFour,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, fnFour, fnFive);
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: reddish),
                      hintText: "Enter Your Password",
                    ),
                    autofocus: false,
                    onSaved: (String value) {
                      var _psd = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: reddish,
                    cursorColor: reddish,
                  ),
                  child: TextFormField(
                    controller: phnumber,
                    textInputAction: TextInputAction.done,
                    focusNode: fnFive,
                    onFieldSubmitted: (value) {
                      fnFour.unfocus();

                      _register();
                    },
                    keyboardType: TextInputType.number,
                    style: style,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
                      labelText: 'PHONE NUMBER',
                      labelStyle: TextStyle(color: reddish),
                      hintText: "Enter Your Mobile number",
                    ),
                    autofocus: true,
                    validator: validateMobile,
                    onSaved: (String val) {
                      var _mobile = val;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
                ),
                Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(17.0),
                  child: Container(
                    child: FlatButton(
                      // MaterialButton(
                      // minWidth: MediaQuery.of(context).size.width / 1.75,
                      // padding: EdgeInsets.fromLTRB(80.0, 15.0, 80.0, 15.0),
                      onPressed: () {
                        // if (_formKey.currentState.validate()) {
                        _register();
                        // }
                      },
                      child: Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: h1TextBlack.copyWith(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                              17.0) //         <--- border radius here
                          ),
                      gradient: LinearGradient(colors: [blushish, reddish]),
                    ),

                    // ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _register() {
    // Validate form field

    var emailStr= email.text;
    var passStr= pass.text;

    if(emailStr.length == 0 || passStr.length < 6){

      if(emailStr.length == 0)
        email.clear();

      if(passStr.length < 6)
        pass.clear();

      return;
    }

    widget.userRepo.signUp(
      email: email.text,
      password:  pass.text
    ).then((val){
      var user = val.user;

      if(user != null){
        print("sing up successful "+ user.email);
        Navigator.pop(context);
      }
    });



  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
  if (value.length != 10)
    return 'Mobile Number must be of 10 digit';
  else
    return null;
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
