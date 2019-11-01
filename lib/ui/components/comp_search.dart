import 'package:flutter/material.dart';

class CompSearch extends StatelessWidget {
  final TextEditingController _searchControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                contentPadding: EdgeInsets.only(left: 30.0, top: 15.0),
                hintStyle: TextStyle(color: Colors.white60),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
