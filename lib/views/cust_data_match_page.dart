import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/main_page.dart';
import 'package:rewahub/views/pin_entry.dart';

class CustDataMatchPage extends StatefulWidget {
  CustDataMatchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CustDataMatchPageState createState() => _CustDataMatchPageState();
}

class _CustDataMatchPageState extends State<CustDataMatchPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  Widget nextButon() {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(17.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(17.0) //         <--- border radius here
              ),
          gradient: LinearGradient(colors: [blushish, reddish]),
        ),
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width / 1.75,
            padding: EdgeInsets.fromLTRB(80.0, 15.0, 80.0, 15.0),
            onPressed: _onClick,
            child: Text(
              "Next",
              textAlign: TextAlign.center,
              style: h1TextBlack.copyWith(
                  color: Colors.white, fontWeight: FontWeight.normal),
            )),

        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // child: Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: 280.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [blushish, reddish],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                    height: 150.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '82% ',
                          style: TextStyle(
                              fontSize: 60.0,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          'MATCHED',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    )),
                buildCard(),

                // Image.asset('assets/images/de.png'),
                Text(
                  '  CUSTOMER DATA                                    ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 26.0,
                    color: reddish,
                  ),
                ),
                Text(
                  ' \n   Photo Matched 82%                                              ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ),
                ),
                new Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.centerRight,
                        // color: Colors.cyan,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '\nFirst Name     :',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Last Name     :',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Date Of Birth  :',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'Address          :\n\n\n',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                          alignment: Alignment.centerLeft,
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Robert',
                                  // textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Almon ',
                                  // textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '30-05-1961 ',
                                  // textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Text(
                                'Wiiz Business Solution\nTejaswini Building\nTrivandrum                                                       ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
                SizedBox(height: 30.0),
                nextButon(),
                SizedBox(height: 20.0), // btn
              ],
            ),
          ],
        ),
      ),
    );
    // ),
  }

  Widget buildCard() {
    return Center(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          child: new Container(
            height: 160.0,
            width: 320.0,
            color: Colors.white,
            child: new Center(
              child: Image.asset('assets/images/match.png'),
            ),
          ),
        ),
      ),
    );
  }

  // passcode verification  $and$ //

  void _onCancel() {}

  void _validCallback() {}

  void _onPasswordEntered(String text) {
    print("Entered password is $text");

    if (text == "1234")
      // Navigator.pop(context,text);

      Navigator.push(context, _onRenter());
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

  void _onPasswordReEntered(String text) {
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
  }

  _onRenter() async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PinEntry(
                  title: 'Re-Enter Passcode',
                  cancelCallback: _onCancel,
                  deleteLocalizedText: 'Delete',
                  cancelLocalizedText: 'Cancel',
                  shouldTriggerVerification: _verificationNotifier.stream,
                  passwordEnteredCallback: _onPasswordReEntered,
                  isValidCallback: _validCallback,
                )));

    print(result.runtimeType.toString());
    print("result is $result");
  }

  // ---------- //

}
