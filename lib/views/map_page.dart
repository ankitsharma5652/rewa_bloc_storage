import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rewahub/ui/styles/styles.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: reddish,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          ),),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: new AppBar(
            centerTitle: true,
            title: Text(
              'YOUR NEAREST STORES',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/Map.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
