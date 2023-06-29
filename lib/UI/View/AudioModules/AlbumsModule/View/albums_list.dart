import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_mix/Utils/Constants/color_constants.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../../../Utils/Constants/image_constant.dart';
import '../../../../CustomWidgets/custom_divider.dart';
import '../../../../CustomWidgets/custom_loader.dart';

// ignore: must_be_immutable
class AlbumsList extends StatelessWidget {
  OnAudioQuery audioQueryTracks;

  AlbumsList(this.audioQueryTracks, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AudioPlayer player;
    return Center(
      child: StreamBuilder<List<AlbumModel>>(
        // Default values:
        stream: audioQueryTracks
            .queryAlbums(
              sortType: null,
              orderType: OrderType.ASC_OR_SMALLER,
              uriType: UriType.EXTERNAL,
              ignoreCase: true,
            )
            .asStream()
            .asBroadcastStream(
              onCancel: (subscription) => subscription.cancel(),
            ),
        builder: (context, item) {
          if (item.hasError) {
            return Text(item.error.toString());
          }
          if (item.data == null) {
            return CustomLoader(AppColor().secondaryColor(context));
          }
          if (item.data!.isEmpty) return const Center(child: Image(image: AssetImage(AppImages.speakerImage)));
          return ListView.separated(
            separatorBuilder: (context, index) =>
                TracksDivider(0.2, AppColor().primaryColor(context)),
            itemCount: item.data!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print(item.data![index]);
                },
                child: ListTile(
                  title: Text(item.data![index].album,overflow: TextOverflow.ellipsis,),
                  subtitle: Text(item.data![index].artist ?? "No Artist"),
                  leading: QueryArtworkWidget(
                    controller: audioQueryTracks,
                    id: item.data![index].id,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: Image.asset(AppImages.emojiMusicImage),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
