import 'package:flutter/material.dart';
import 'package:rewahub/views/voucher_single_item.dart';




class VoucherData extends StatefulWidget {
  @override
  VoucherDataState createState() => VoucherDataState();
}

class VoucherDataState extends State<VoucherData> {
  var productList = [
    {
      "name": "MOMOS",
      "picture": "assets/images/food1.jpeg",
      "old price": 56,
      "Exp": "Expire on 24-aug-2019",
      "Qty": "QTY1",
      "dollar": "\$2.65",
    },
    {
      "name": "TACOS",
      "picture": "assets/images/food2.jpeg",
      "old price": 56,
      "Exp": "Expire on 24-aug-2019",
      "Qty": "QTY3",
      "dollar": "\$6.00",
    },
    {
      "name": "BURGER",
      "picture": "assets/images/food3.jpeg",
      "old price": 56,
      "Exp": "Expire on 24-aug-2019",
      "Qty": "QTY1",
      "dollar": "\$7.50",
    },
    {
      "name": "VEG SALAD",
      "picture": "assets/images/food4.jpeg",
      "old price": 56,
      "Exp": "Expire on 24-aug-2019",
      "Qty": "QTY1",
      "dollar": "\$4.65",
    },

    {
      "name": "BURGER KING IS ROLLING OUT MEATLESS IMPOSSIBLE WHOPPERS NATIONWIDE",
      "picture": "assets/images/food5.jpeg",
      "old price": 56,
      "Exp": "Expire on 24-aug-2019",
      "Qty": "QTY1",
      "dollar": "\$2.65",
    },
    {
      "name": "STEAK WITH BARBECUE SAUCE",
      "picture": "assets/images/food6.jpeg",
      "old price": 56,
      "Exp": "Expire on 24-aug-2019",
      "Qty": "QTY3",
      "dollar": "\$6.00",
    },
    {
      "name": "PIZAA",
      "picture": "assets/images/food7.jpeg",
      "old price": 56,
      "Exp": "Expire on 24-aug-2019",
      "Qty": "QTY1",
      "dollar": "\$7.50",
    },
    {
      "name": "GREEN SALAD",
      "picture": "assets/images/food8.jpeg",
      "old price": 56,
      "Exp": "Expire on 24-aug-2019",
      "Qty": "QTY1",
      "dollar": "\$4.65",
    },
   
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
     
      padding: EdgeInsets.only(left: 15.0,top: 15.0,right: 15.0),
      
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.85,mainAxisSpacing: 15,crossAxisSpacing: 15),
            
        itemBuilder: (BuildContext context, int index) {
          return VoucherSingleItem(
            productName: productList[index]['name'],
            productPicture: productList[index]['picture'],
            productOldPrice: productList[index]['old price'],
            productPrice: productList[index]['Exp'],
            productQty: productList[index]['Qty'],
            productRs: productList[index]['dollar'],
          );
        });
  }
}
