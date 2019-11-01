import 'package:flutter/material.dart';
import 'package:rewahub/ui/styles/styles.dart';
import 'package:rewahub/views/home_item_details_page.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class HomeTrendingItemPage extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;
  final String rewards;
  final String col;

  HomeTrendingItemPage({
    Key key,
    @required this.img,
    @required this.title,
    @required this.address,
    @required this.rating,
    @required this.rewards,
    @required this.col,
  }) : super(key: key);

  @override
  _HomeTrendingItemPageState createState() => _HomeTrendingItemPageState();
}

class _HomeTrendingItemPageState extends State<HomeTrendingItemPage> {
  double _rating = 8;
  @override

  // card color $and$ //
  Widget build(BuildContext context) {
    List<Color> _colors = [
      //Get list of colors
      Color.fromRGBO(149, 183, 66, 1),
      Color.fromRGBO(203, 101, 72, 1),
      Colors.green,
      Colors.brown,
      Colors.blue,
      Colors.red,
      Colors.teal,
      Colors.purple,
      Colors.deepOrange,
      Colors.cyan,
      Colors.indigo,
    ];

    var x = int.parse("${widget.rating}");
    int _currentIndex = x;
    setState(() {
      if (_currentIndex == _currentIndex) {
        _currentIndex = _currentIndex;
      } else {
        _currentIndex += 1;
      }
    });

    // ------------- //
    return Container(
      // padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 3.0,
          color: _colors[_currentIndex],
          child: InkWell(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 3.63,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ), //10
                        child: Image.asset(
                          "${widget.img}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2.0,
                      right: 30.0,
                      // child: Padding(
                      // padding: EdgeInsets.all(4.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              " ${widget.address} ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      // ),
                      // ),
                    ),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      top: 0.0,
                      left: 0.0,
                      child: Container(
                        height: 30.0,
                        padding: EdgeInsets.only(top: 2.0),
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(0.0)), //4
                        // child: Padding(
                        // padding: EdgeInsets.all(4.0),
                        child: Text(
                          " ${widget.title} -  ",
                          style: TextStyle(
                            fontSize: 15,
                            color: reddish,
                          ),
                        ),
                        // ),
                      ),
                    ),
                    Positioned(
                      bottom: 25.0,
                      left: 6.0,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            border: Border.all(width: .1, color: Colors.white)),

                        // shape: BoxShape.circle,

                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.card_giftcard,
                            size: 40,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25.0,
                      left: 60.0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          border: Border.all(width: .1, color: Colors.white),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.monetization_on,
                            size: 40,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 23.0,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "3",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 67.0,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "100",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 7.0),
                Padding(
                  padding: EdgeInsets.only(left: 3.0, top: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: SmoothStarRating(
                              allowHalfRating: false,
                              // onRatingChanged: (v) {
                              //   setState(() {
                              //     _rating = v;
                              //   });
                              // },
                              starCount: 10,
                              rating: _rating,
                              size: 18.0,
                              color: Colors.white,
                              borderColor: Colors.white,
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            right: 0.0,

                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Two points far form a Reward",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            // ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 10.0),
              ],
            ),
            splashColor: Colors.grey[200],
            onTap: onCardClick,
          ),
        ),
      ),
    );
  }

  void onCardClick() {
    // var snackbar = SnackBar(
    //   content: Text('${widget.title} is clicked',
    //       style: TextStyle(color: Colors.white)),
    //   backgroundColor: Colors.black,
    //   action: SnackBarAction(
    //     textColor: Colors.limeAccent,
    //     label: 'Dismiss',
    //     onPressed: () {
    //       Scaffold.of(context).hideCurrentSnackBar();
    //     },
    //   ),
    // );
    // Scaffold.of(context).showSnackBar(snackbar);

    // Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) {
    //           return new ProductPage(
    //             // productData: restaurants[1],
    //           );
    //         },
    //       ),
    //     );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeItemDetailsPage()),
    );
  }
}
