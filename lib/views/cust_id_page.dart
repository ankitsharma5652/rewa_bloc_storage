import 'package:flutter/material.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/cust_selfie_page.dart';

class CustIdPage extends StatefulWidget {
  CustIdPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CustIdPagestate createState() => CustIdPagestate();
}

class CustIdPagestate extends State<CustIdPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustSelfiePage()),
              );
            },
            child: Text(
              "START SCAN",
              textAlign: TextAlign.center,
              style: h1TextBlack.copyWith(
                  color: Colors.white, fontWeight: FontWeight.normal),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height: 180.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Submit your Identity, Passport or \n Driving License or \n Aadhar etc.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                buildCard(),
                SizedBox(height: 200.0),
                Text(
                  "Scan your Aadhar",
                  style: style.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 25.0),
                nextButon(),
                SizedBox(height: 20.0),
              ],
            ), // btn
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return Center(
      child: Card(
        margin: EdgeInsets.only(bottom: 10.0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          child: new Container(
            height: 170.0,
            width: 330.0,
            color: Colors.white,
            child: new Center(
              child: Image.asset('assets/images/val.png'),
            ),
          ),
        ),
      ),
    );
  }
}
