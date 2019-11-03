import 'package:flutter/material.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/cust_data_match_page.dart';

class CustSelfiePage extends StatefulWidget {
  CustSelfiePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustSelfiePageState createState() => _CustSelfiePageState();
}

class _CustSelfiePageState extends State<CustSelfiePage> {
  @override
  Widget build(BuildContext context) {
    // TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    final Selfibutton = Material(
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
          // minWidth: MediaQuery.of(context).size.width / 1.75,
          padding: EdgeInsets.fromLTRB(80.0, 15.0, 80.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustDataMatchPage()),
            );
          },
          child: Text(
            "Take Selfie",
            textAlign: TextAlign.center,
            style: h1TextBlack.copyWith(
                color: Colors.white, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "\n Let us validate your identity with your Photo",
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: 330.0,
              height: 380.0,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/user.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.elliptical(350, 400)),
                border: Border.all(
                  color: reddish,
                  width: 4.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Selfibutton,
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
