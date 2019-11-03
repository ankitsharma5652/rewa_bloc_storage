import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rewahub/ui/components/comp_card.dart';
import 'package:rewahub/ui/styles/styles.dart';

class PayNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final size = 100;
    final message = 'PayNow';
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.topLeft,
                stops: [0.05, 0.3],
                colors: [blushish, reddish],
              ),
            ),
            height: 100,
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                            top: 30.0,
                            left: 65.0,
                            right: 60.0,
                          ),
                          height: 225.0,
                          width: 225.0,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: Offset(.5, 0.5),
                                blurRadius: 2.0,
                              ),
                            ],
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.pink,
                              width: 2.0,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 70.0),
                          child: QrImage(
                            data: message,
                            size: 115,
                            foregroundColor: Colors.black54,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            top: 185.0,
                          ),
                          child: GradientText(
                            "RS 434.25",
                            gradient:
                                LinearGradient(colors: [blushish, reddish]),
                            style: TextStyle(fontSize: 20),
                            //textAlign: TextAlign.justify
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 70, left: 50),
                      // padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          //SizedBox(width: 5,),
                          // Padding(
                          //   padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          //  child:
                          Image.asset(
                            'assets/images/visa.png',
                            height: 22.0,
                          ),
                          // new Icon(FontAwesomeIcons.ccVisa , color:Colors.blue,),
                          Image.asset(
                            'assets/images/dots.png',
                            height: 12,
                          ),

                          Text(
                            "4485",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),

                          Image.asset(
                            'assets/images/settings.png',
                            height: 28,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(45.0, 50.0, 45.0, 30.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                                17.0) //         <--- border radius here
                            ),
                        color: Colors.white,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddCard()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'MANAGE CARD',
                              style: style.copyWith(
                                  color: reddish,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
