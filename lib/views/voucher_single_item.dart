
import 'package:flutter/material.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/voucher_detail_page.dart';

class VoucherSingleItem extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;
  final productQty;
  final productRs;
  

  VoucherSingleItem(
      {this.productName,
      this.productPicture,
      this.productOldPrice,
      this.productPrice,
      this.productQty,
      this.productRs});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: buildProduct(context),
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => VoucherDataDetails(
                    //navigate to detailed page with passing data
                    productDetailsName: productName,
                    productDetailsPicture: productPicture,
                    productDetailsOldPrice: productOldPrice,
                    productDetailsNewPrice: productPrice,
                  ))),
    );
  }

  Widget buildProduct(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(top: 13.0, bottom: 0.0, left: 10.0, right: 10.0),
      child: Container(
      //  padding: EdgeInsets.only( left: 10.0, right: 10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 3,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          // color: Colors.white,
          child: InkWell(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ), //10
                        child: Image.asset(
                          productPicture,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 15,
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10.0)),
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                        ),
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))), //4
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            productQty,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 15,
                      top: 20.0,
                      left: 0.0,
                      // child: Card(
                      //   color: Color.fromRGBO(0, 0, 0, 0.0),
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(0.0)), //4
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          productRs,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // ),
                    ),
                  ],
                ),
              //  SizedBox(height: 4.0),
                Padding(
                  padding: EdgeInsets.only(left: 3.0),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 10.0),
                            child:Container(
                              
                              height: 35.0,
                            child: Text(
                              productName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 35.0,
                      // ),
                      Text(
                        "Expire on 24-aug-2019",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: reddish,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
