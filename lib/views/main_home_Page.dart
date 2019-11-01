import 'package:flutter/material.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/tabbar.dart';



class MainHomePage extends StatefulWidget {
  MainHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final int initialIndex = 1;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: new AppBar(
            elevation: 0.0,
            centerTitle: false,
            title: Container(
              //height: MediaQuery.of(context).size.height / 2.75,
              width: MediaQuery.of(context).size.width / 1.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: new Text(
                    "Vouchers",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  ),
                ),
                Tab(
                  child: new Text(
                    "Pay Now",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  ),
                ),
                Tab(
                  child: new Text(
                    "Points",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: tabbody(),
       
      ),
    ));
  }
}
