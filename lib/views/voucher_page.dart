import 'package:flutter/material.dart';
import 'package:rewahub/models/product.dart';
import 'package:rewahub/ui/components/comp_search.dart';
import 'package:rewahub/ui/styles/styles.dart';



class VoucherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(
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
              margin: new EdgeInsets.only(
                top: 0.0,
              ),
              height: 100.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  ),
                  CompSearch(),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "         Tap the Items for Redeem",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100.0),
              child: VoucherData(),
            ),
          ],
        )
      ],

      //  ),
    );
  }
}
