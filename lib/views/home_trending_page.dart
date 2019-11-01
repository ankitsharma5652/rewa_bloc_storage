import 'package:flutter/material.dart';
import 'package:rewahub/models/restaurants.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/home_trending_item.dart';

class HomeTrendingPage extends StatefulWidget {
  @override
  _HomeTrendingPageState createState() => _HomeTrendingPageState();
}

class _HomeTrendingPageState extends State<HomeTrendingPage> {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: new AppBar(
          centerTitle: false,
          bottom: new PreferredSize(
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "8956",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Image.asset(
                  'assets/images/rewahub_icon.png',
                  height: 50.0,
                ),
                Text(
                  "RS 434.25",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.topLeft,
                stops: [0.05, 0.3],
                colors: [blushish, reddish],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(05.0, 0, 05.0, 0), //10
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5.0), //10
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurants == null ? 0 : restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = restaurants[index];

                return HomeTrendingItemPage(
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                  col: restaurant["col"],
                );
              },
            ),
            SizedBox(height: 05.0), //
          ],
        ),
      ),
    );
  }
}
