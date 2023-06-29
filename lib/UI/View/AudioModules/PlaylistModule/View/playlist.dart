import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/Utils/Constants/image_constant.dart';
import 'package:music_mix/Utils/Constants/text_style_constant.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../Utils/Constants/color_constants.dart';
import '../../../../../Utils/Constants/string_constants.dart';
import '../../../../../routes/routes.dart';
import '../../../HomePageModule/View/home_page.dart';
import 'playlist_data.dart';

// ignore: must_be_immutable
class PlayLists extends StatelessWidget {
  OnAudioQuery audioQueryEx;
  PlayLists(this.audioQueryEx,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor().onPrimaryColor(context),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              centerTitle: true,
              backgroundColor: AppColor().primaryColor(context),
              titleTextStyle: TextStyle(
                  fontSize: 24, color: AppColor().surfaceColor(context)),
              iconTheme: IconThemeData(color: AppColor().surfaceColor(context)),
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Get.back();
                  }),
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: Text(AppStrings.playlistTxt,
                      style: AppTxtStyle.customAppbarTxtStyle),
                  background: Image.asset(
                    AppImages.musicShow4Image,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: PlayListData(audioQueryEx),
      ),
    );
  }
}
