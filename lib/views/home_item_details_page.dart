import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/layout_type.dart';

class HomeItemDetailsHeader implements SliverPersistentHeaderDelegate {
  HomeItemDetailsHeader({
    this.layoutGroup,
    this.onLayoutToggle,
    this.minExtent,
    this.maxExtent,
  });
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/details.png',
          fit: BoxFit.fill,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          top: 30.0,
          right: 20.0,
          child: IconButton(
            icon: new Icon(
              Icons.close,
              color: Colors.white70,
              size: 30.0,
            ),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class HomeItemDetailsPage extends StatelessWidget implements HasLayoutGroup {
  HomeItemDetailsPage({Key key, this.layoutGroup, this.onLayoutToggle})
      : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HomeItemDetailsHeader(
              layoutGroup: layoutGroup,
              onLayoutToggle: onLayoutToggle,
              minExtent: 150.0,
              maxExtent: 250.0,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: .494,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(05.0, 0.0, 05.0, 0.0),

                    // child: Card(
                    // semanticContainer: true,
                    // color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          child: buildtxtbtn(context),
                        ),
                        SizedBox(
                          height: 100,
                          child: buildspecial(context),
                        ),
                        SizedBox(
                          height: 100,
                          child: buildrefer(),
                        ),
                        SizedBox(
                          height: 125,
                          child: buildponts(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        SizedBox(
                          height: 125,
                          child: buildponts(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        SizedBox(
                          height: 125,
                          child: buildponts(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        SizedBox(
                          height: 125,
                          child: buildponts(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildtxtbtn(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'GET MORE BACK',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'view all',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
    color: Colors.white,
  );
}

Widget buildspecial(BuildContext context) {
  return Container(
    height: 2,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0))),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(248, 234, 184, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.card_giftcard,
                    color:reddish,
                    size: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(248, 234, 184, 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SMOOTHE Special',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Earn 4x points and Special Rewards for \nany regular smoothe',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black38,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Today 12:00 - 18:30',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildrefer() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5)),
    ),
    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
    height: 5,
    // color: Color.fromRGBO(165, 37, 130, 1),

    child: Row(
      children: <Widget>[
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              color: Color.fromRGBO(165, 37, 130, 1),
            ),
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'FANCY FREE OFFER',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Earn a new coffee when you \ninvite a friend',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(225, 225, 225, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                )),
            child: Image.asset("assets/images/gift.png"),
          ),
        ),
      ],
    ),
  );
}

Widget buildponts() {
  return Container(
    height: 10,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      color: Colors.white,
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            // color: Colors.,
            child: Image.asset(
              "assets/images/cup.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Image.asset(
            "assets/images/tile.png",
            fit: BoxFit.contain,
          ),
        ),
      ],
    ),
  );
}