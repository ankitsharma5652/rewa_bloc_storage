import 'package:flutter/material.dart';
import 'package:rewahub/views/home_trending_page.dart';
import 'package:rewahub/views/main_home_Page.dart';
import 'package:rewahub/views/map_page.dart';
import 'package:rewahub/views/settings_page.dart';
import 'package:rewahub/views/transactions_page.dart';



class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController;
  int _selectedTab = 2;
  final _pageOptions = [
    HomeTrendingPage(),
    MapPage(),
    MainHomePage(),
    TransactionsPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.pink[300],
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),
          )),
      home: Scaffold(
      
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.select_all),
              
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Transactions'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
