import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:rewahub/ui/styles/styles.dart';

class PointsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildCard() => new Container(
          margin: new EdgeInsets.symmetric(vertical: 40.0),
          child: new Center(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              // padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: new Container(
                  height: MediaQuery.of(context).size.height / 2.7,
                  width: MediaQuery.of(context).size.width / 1.25,
                  child: new Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        ' YOU HAVE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        child: 
                        GradientText(
                          
                          ' 8956',
                          gradient: LinearGradient(colors: [blushish, reddish]),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            fontSize: 80.0,
                          ),
                        ),
                      ),
                      Text(
                        ' POINTS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black54,
                        ),
                      ),
                      Align(
                          alignment: Alignment(
                            0.8,
                            -0.2,
                          ),
                          child: Icon(
                            Icons.share,
                            color: reddish,
                            size: 32,
                          )),
                      Align(
                          alignment: Alignment(0.8, -0.2),
                          child: Text(
                            "SHARE", style: TextStyle(fontSize: 10),
                            // textAlign: TextAlign.center,
                          )),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );

    return Stack(
      children: <Widget>[
        Stack(
          //overflow: Overflow.visible,
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
              //alignment: Alignment.center,
              margin: new EdgeInsets.only(
                top: 0.0,
              ),

              height: 100.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0.0,
                      bottom: 0.0,
                      left: 300.0,
                      right: 200.0,
                    ),
                  )
                ],
              ),
            ),
            _buildCard(),
          ],
        )
      ],
    );
  }
}
