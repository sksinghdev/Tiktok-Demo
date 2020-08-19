
import 'package:flutter/material.dart';
import 'package:videoplay/animations/spinner_animation.dart';
import 'package:videoplay/controller/video_control_action.dart';
import 'package:videoplay/uiutils/assets.dart';
import 'package:videoplay/uiutils/audio_spinner_icon.dart';
import 'package:videoplay/uiutils/user_profile.dart';
import 'package:videoplay/uiutils/video_desc.dart';

Widget onScreenControls(commentcount,likecount,sharecount,title,username,userimage) {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(flex: 5, child: videoDesc(username,title)),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(bottom: 60, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                userProfile(username,userimage),
                videoControlAction(icon: AppIcons.heart, label: likecount.toString()),
                videoControlAction(icon: AppIcons.chat_bubble, label: commentcount.toString()),
                videoControlAction(
                    icon: AppIcons.reply, label: sharecount.toString(), size: 27),
                SpinnerAnimation(body: audioSpinner(userimage))
              ],
            ),
          ),
        )
      ],
    ),
  );
}