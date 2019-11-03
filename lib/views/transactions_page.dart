import 'package:flutter/material.dart';
import 'package:rewahub/ui/components/comp_search.dart';
import 'package:rewahub/ui/styles/styles.dart';




class TransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: new AppBar(
          elevation: 0.0,
          centerTitle: false,
          bottom: new PreferredSize(
            child: Column(
              children: <Widget>[
                new Row(
                  mainAxisSize: MainAxisSize.max,
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
      body: Column(
        
        children: <Widget>[
          SizedBox(height: 100.0,
            child: CompSearch(),
          ),
          Expanded(
            child: TransactionBody(),
          )
        ],
      ),
    );
  }
}

class TransactionBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return Container(
    padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    // margin: EdgeInsets.symmetric(vertical: 6.0),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      border: Border.all(color: Colors.white),
    ),

    child: new ListView(
      //  padding: new EdgeInsetsDirectional.only(start: 0.0, end: 0.0),

      children: ListTile.divideTiles(
        color: Colors.pink[400],
        context: context,
        tiles: [
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            title: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Cappuccino Coffee",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            subtitle: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new SizedBox(height: 6.0),
                new Text(
                  " Quantity 2",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                new SizedBox(height: 4.0),
                new Text(
                  " 10-june-2019",
                  style: TextStyle(
                    fontSize: 15,
                    color: reddish,
                  ),
                ),
              ],
            ),
            trailing: Text(
              '(\$ 4.32)',
              style: TextStyle(
                fontSize: 35,
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal,
              ),
            ),
            dense: false,
            onTap: () {
              print('Notifications');
            
            },
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            title: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Burger With Coffee",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            subtitle: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new SizedBox(height: 6.0),
                new Text(
                  " Quantity 2",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                new SizedBox(height: 4.0),
                new Text(
                  " 10-june-2019",
                  style: TextStyle(
                    fontSize: 15,
                    color: reddish,
                  ),
                ),
              ],
            ),
            trailing: Text(
              '(\$ 7.14)',
              style: TextStyle(
                fontSize: 35,
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal,
              ),
            ),
            dense: false,
            onTap: () {
              print('Notifications');
            },
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            title: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Topup From Card",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            subtitle: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new SizedBox(height: 6.0),
                new Text(
                  "   ",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                new SizedBox(height: 4.0),
                new Text(
                  " 10-june-2019",
                  style: TextStyle(
                    fontSize: 15,
                    color: reddish,
                  ),
                ),
              ],
            ),
            trailing: Text(
              '(\$ 50.00)',
              style: TextStyle(
                fontSize: 35,
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal,
              ),
            ),
            dense: false,
            onTap: () {
              print('Notifications');
            },
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            title: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "French Toast",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            subtitle: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new SizedBox(height: 6.0),
                new Text(
                  " Quantity 2",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                new SizedBox(height: 4.0),
                new Text(
                  " 10-june-2019",
                  style: TextStyle(
                    fontSize: 15,
                    color: reddish,
                  ),
                ),
              ],
            ),
            // trailing: new Container(
            //   child: new Row(
            //     children: <Widget>[
            //      Text('('),
            //      Text('\$'),
            //      Text('9.'),
            //      Text('22'),
            //      Text(')'),
            //     ],
            //   ),
            // ),
            trailing: Text(
              '(\$ 9.22)',
              style: TextStyle(
                fontSize: 35,
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal,
              ),
            ),
            dense: false,
            onTap: () {
              print('Notifications');
            },
          ),
          new ListTile(
            contentPadding: EdgeInsets.only(top: 10, bottom: 10),
            title: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Redeem Pizza",
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            subtitle: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new SizedBox(height: 6.0),
                new Text(
                  " Quantity 2",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                new SizedBox(height: 4.0),
                new Text(
                  " 10-june-2019",
                  style: TextStyle(
                    fontSize: 15,
                    color: reddish,
                  ),
                ),
              ],
            ),
            trailing: Text(
              '(\$ 5.37)',
              style: TextStyle(
                fontSize: 35,
                color: Colors.blueGrey,
                fontWeight: FontWeight.normal,
              ),
            ),
            dense: false,
            onTap: () {
              print('Notifications');
            },
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ).toList(),
    ),

    //  ),
  );
}
