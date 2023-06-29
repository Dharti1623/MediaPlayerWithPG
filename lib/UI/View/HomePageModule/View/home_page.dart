import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_mix/UI/View/AudioModules/AlbumsModule/View/albums.dart';
import 'package:music_mix/UI/View/AudioModules/ArtistsModule/View/artists.dart';
import 'package:music_mix/UI/View/AudioModules/PlaylistModule/View/playlist.dart';
import 'package:music_mix/Utils/Constants/image_constant.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../HelperClasses/ad_helper.dart';
import '../../../../Network/NetworkHandler/custom_dio.dart';
import '../../../../Utils/Constants/color_constants.dart';
import '../../../../Utils/Constants/image_constant.dart';
import '../../../../Utils/Constants/string_constants.dart';
import '../../../../Utils/common_function.dart';
import '../../../../routes/routes.dart';
import '../../AudioModules/AlbumsModule/View/albums.dart';
import '../../AudioModules/PlaylistModule/View/playlist.dart';
import '../../AudioModules/SongsModule/View/songs.dart';
import '../../PaymentScreen/View/payment_button.dart';
import '../../PaymentScreen/View/offer_list_screen.dart';
import 'bg_image.dart';
import 'custom_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OnAudioQuery audioQueryEx = OnAudioQuery();
  Rx<AudioPlayer> player = AudioPlayer().obs;
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    //Load a banner ad
    loadAd();
    print('aoadad-->$_bannerAd');
  }

  // final player = AudioPlayer();

  @override
  void didChangeDependencies() {
    loadAd();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    loadAd();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    //Dispose a BannerAd object
    _bannerAd!.dispose();
    super.dispose();
  }

  loadAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor().onPrimaryColor(context),
      body: Padding(
        padding: EdgeInsets.only(top: getStatusBarHeight(context)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                AppImages.musicPianoImage,
                height: size.height,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Platform.isIOS
                    ? const SizedBox()
                    : CustomButton(
                        onTapBtn: () {
                          Get.to(() => PlayLists(audioQueryEx));
                        },
                        height: size.height * 0.07,
                        width: size.width * 0.4,
                        child: Text(
                          AppStrings.playlistTxt,
                          style: TextStyle(
                              color: AppColor().primaryColor(context),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )),
                CustomButton(
                    onTapBtn: () {
                      Get.to(() => Songs(audioQueryEx, player));
                    },
                    height: size.height * 0.07,
                    width: size.width * 0.4,
                    child: Text(
                      AppStrings.tracksTxt,
                      style: TextStyle(
                          color: AppColor().primaryColor(context),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
                CustomButton(
                    onTapBtn: () {
                      Get.to(() => Albums(audioQueryEx));
                    },
                    height: size.height * 0.07,
                    width: size.width * 0.4,
                    child: Text(
                      AppStrings.albumsTxt,
                      style: TextStyle(
                          color: AppColor().primaryColor(context),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
                CustomButton(
                    onTapBtn: () {
                      Get.to(() => Artists(audioQueryEx));
                    },
                    height: size.height * 0.07,
                    width: size.width * 0.4,
                    child: Text(
                      AppStrings.artistsTxt,
                      style: TextStyle(
                          color: AppColor().primaryColor(context),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
              ],
            ),
            if (_bannerAd != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  // color: AppColor.bgWhiteClr,
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      Expanded(
                        flex: 18,
                        child: SizedBox(
                          width: _bannerAd!.size.width.toDouble(),
                          height: _bannerAd!.size.height.toDouble(),
                          child: AdWidget(ad: _bannerAd!),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => OfferListScreen());
                            },
                            padding: EdgeInsets.zero,
                            iconSize: 35,
                            tooltip: 'Remove ads',
                            splashRadius: 1,
                            icon: Icon(Icons.remove_circle),
                            color: AppColor.bgBlackClr),
                      ),
                      /*GestureDetector(
                        onTap: (){
                          Get.to(() => OfferListScreen());
                        },
                          child: Image.asset(
                        AppImages.noAdsImage,
                        width: 39,
                      )),*/
                      // const PaymentButton(),
                    ],
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

onTapBtn() {
  print('On tap called');
}
