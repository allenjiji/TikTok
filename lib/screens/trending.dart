import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:http/http.dart';
import 'package:tiktok/classes/tiktok.dart';
import 'package:tiktok/config/api.dart';
import 'package:http/http.dart' as http;
import 'package:tiktok/screens/tiktokvideo.dart';

import 'tiktokvideo.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  PageController pageController;
  RequestController api = RequestController();
  List<Widget> tikTokVideos = [
    /* TikTokVideo(),
    TikTokVideo(),
    TikTokVideo(),
    TikTokVideo(), */
  ];

  getTrending() async {
    //var cookies = await api.getCookie();
    //api.setCookie(cookies);
    try {
      /* var response = await http.get(
        api.url,
        headers: api.headers,
      ); */

      /* final databaseReference = Firestore.instance;
      databaseReference
          .collection('home-videos')
          .document('video urls')
          .get()
          .then((value) {
        List videoUrls = value.data['urls'];
        print(videoUrls);
        videoUrls.forEach((element) {
          print("elements are");
          print(element);
          String string = element;
          setState(() {
            tikTokVideos.add(TikTokVideo(url: string));
          });
          print(tikTokVideos);
        });
      }); */
      String url = 'https://shawfloors.ca/video_soft/video/get_video';
      Response response = await get(url);
      var res = json.decode(response.body);
      print(json.decode(response.body));
      print(res["data"]);
      List videoUrls = res['data'];
      videoUrls.forEach((element) {
        String url = element['url'];
        String description = element['title'];
        //print(url);
        setState(() {
          tikTokVideos.add(TikTokVideo(
            url: url,
            description: description,
          ));
        });
      });
      //List videoUrls = response.body['data'];
      //print("This is the Body Start!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      //print("This is the Body End!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      /* Tiktok tiktok = Tiktok.fromJson(jsonDecode(response.body));
      tiktok.body.itemListData.forEach(
        (item) {
          setState(() {
            tikTokVideos.add(TikTokVideo(
              url:
                  "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly",
            ));
          });
        },
      ); */
    } catch (ex) {
      print(ex);
    }
  }

  @override
  void initState() {
    super.initState();
    getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: pageController,
      children: tikTokVideos.length == 0
          ? <Widget>[
              Container(
                color: Colors.black,
                child: Center(
                  child: GFLoader(
                    type: GFLoaderType.circle,
                    loaderColorOne: Colors.blueAccent,
                    loaderColorTwo: Colors.black,
                    loaderColorThree: Colors.pink,
                  ),
                ),
              )
            ]
          : tikTokVideos,
    );
  }
}
