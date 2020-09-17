import 'package:flutter/material.dart';
import 'package:tiktok/classes/tiktok.dart';
import 'package:tiktok/widget/leftItems.dart';
import 'package:tiktok/widget/rightItems.dart';
import 'package:tiktok/widget/videoPlayer.dart';

class TikTokVideo extends StatelessWidget {
  //final ItemListData data;
  final String url, description;

  TikTokVideo({data, @required this.url, @required this.description});

  @override
  Widget build(BuildContext context) {
    //print("This Is This");
    //print(url);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          TikTokVideoPlayer(
              url:
                  /* 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly' */ url /* data.itemInfos.video.urls[0] */),
          title(),
          RightItems(
              comments: '100', //data.itemInfos.commentCount.toString(),
              userImg:
                  'https://img.icons8.com/pastel-glyph/2x/user-male.png', //data.authorInfos.covers[0],
              favorite: 50000000, //data.itemInfos.diggCount,
              coverImg:
                  'https://img.icons8.com/pastel-glyph/2x/user-male.png' //data.musicInfos.covers[0],
              ),
          LeftItems(
              description: description, //data.itemInfos.text,
              musicName: "Watch this Video", //data.musicInfos.musicName,
              authorName: "creator", //data.musicInfos.authorName,
              userName: 'creator' //data.authorInfos.uniqueId,
              )
        ],
      ),
    );
  }

  Widget title() => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0),
          child: Text(
            "Trending | For You",
            style: TextStyle(color: Colors.white, fontSize: 19.0),
          ),
        ),
      );
}
