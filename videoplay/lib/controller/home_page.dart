import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:videoplay/connection/api.dart';
import 'package:videoplay/controller/home_video_renderer.dart';
import 'package:videoplay/controller/onscreen_controls.dart';
import 'package:http/http.dart' as http;
import 'package:videoplay/model/media_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<media_model> medialist = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchData("https://www.pinkvilla.com/feed/video-test/video-feed.json");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<media_model>>(
      future: Api.fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? PhotosList(photos: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  fetchData(String url) async {
//    var res = await http.get(url);
//    var data = jsonDecode(res.body);
//    medialist = data as List<media_model>;
  var media = Api.getProfile(url) ;


   // var lenghtof = media.length;
    //print("media json length : $media");
    print('called json value : $media');
    setState(() {});

  FutureBuilder<List<media_model>>(
    future: Api.fetchPhotos(http.Client()),
    builder: (context, snapshot) {
      if (snapshot.hasError) print(snapshot.error);

      return snapshot.hasData
          ? PhotosList(photos: snapshot.data)
          : Center(child: CircularProgressIndicator());
    },
  );
  }
}

//class HomeScreen extends StatelessWidget {
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return PageView.builder(
//        scrollDirection: Axis.vertical,
//        itemBuilder: (context, position) {
//          return Container(
//            color: Colors.black,
//            child: Stack(
//              children: <Widget>[AppVideoPlayer(), onScreenControls()],
//            ),
//          );
//        },
//        itemCount: 10);
//  }
//}
class PhotosList extends StatelessWidget {
  final List<media_model> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {
          return Container(
            color: Colors.black,
            child: Stack(
              children: <Widget>[AppVideoPlayer(photos[position].url), onScreenControls(photos[position].commentCount,photos[position].likeCount,photos[position].shareCount,photos[position].title,photos[position].user.name,photos[position].user.headshot)],
            ),
          );
        },
        itemCount: photos.length);
  }
}