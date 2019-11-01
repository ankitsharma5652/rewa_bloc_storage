import 'package:flutter/material.dart';
import 'package:rewahub/views/paynow_page.dart';
import 'package:rewahub/views/points_page.dart';
import 'package:rewahub/views/voucher_page.dart';

class tabbar extends StatefulWidget {
  @override
  _tabbarState createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TabBar(
                
                  tabs: [
                    Tab(
                      child: new Text(
                        "Credit Card",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .apply(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: new Text(
                        "Debit Card",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .apply(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: new Text(
                        "Afro Card",
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .apply(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class tabbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        VoucherPage(),
        PayNowPage(),
        PointsPage(),
      ],
    );
  }
}
