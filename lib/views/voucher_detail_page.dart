import 'package:flutter/material.dart';
import 'package:rewahub/ui/styles/styles.dart';

class VoucherDataDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsOldPrice;
  final productDetailsNewPrice;
  final productDetailsPicture;
  final productQty;
  final productRs;

  VoucherDataDetails(
      {this.productDetailsName,
      this.productDetailsPicture,
      this.productDetailsOldPrice,
      this.productDetailsNewPrice,
      this.productQty,
      this.productRs});

  @override
  VoucherDataDetailsState createState() => VoucherDataDetailsState();
}

class VoucherDataDetailsState extends State<VoucherDataDetails> {
  int quantity = 1;

  List<bool> selectedColor = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: blushish,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    color: reddish,
                  ),
                ),
              ],
            ),
          ),
        ]),
        Container(
          child: buildCard(),
        ),
        Positioned(
          top: 30.0,
          right: 10.0,
          child: IconButton(
            icon: new Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
      ],
    );
  }

  Widget buildCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.fromLTRB(40, 70, 40, 60),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    widget.productDetailsPicture,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "\$2.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35.0),
                    ),
                    new Text(
                      "00",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                new Image.asset(
                  'assets/images/qr.png',
                  fit: BoxFit.fill,
                  width: 150.0,
                  height: 150.0,
                ),
                new Text(
                  "\n Scan the QRcode for \n reddem this item",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Icon(
                      Icons.share,
                      color: reddish,
                      size: 22.0,
                    ),
                    new Text(
                      "   SHARE THIS ITEM",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
