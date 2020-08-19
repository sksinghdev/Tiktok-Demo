import 'package:flutter/material.dart';

Widget videoDesc(username,title) {
  return Container(
    padding: EdgeInsets.only(left: 16, bottom: 60),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 7, bottom: 7),
          child: Text(
            "@$username",
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4, bottom: 7),
          child: Text(
              "$title",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300)),
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.music_note,
              size: 19,
              color: Colors.white,
            ),
            Text(
              "Lorem ipsum dolor sit amet ...",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ],
    ),
  );
}