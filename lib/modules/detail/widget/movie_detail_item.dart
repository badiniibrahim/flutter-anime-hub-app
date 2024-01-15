import 'package:animehub/modules/detail/controller/anime_detail_controller.dart';
import 'package:animehub/modules/detail/widget/screenshot_widget.dart';
import 'package:animehub/modules/detail/widget/youtube_view.dart';
import 'package:animehub/utils/colors.style.dart';
import 'package:animehub/utils/texts.style.dart';
import 'package:animehub/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeDetailItem extends StatelessWidget {
  const AnimeDetailItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimeDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black2,
      appBar: AppBar(
        backgroundColor: AppColors.black2,
        title: Text(
          controller.state.animeDetail.name ?? "",
          style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
            color: AppColors.white,
            fontFamily: 'muli',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    "https://shikimori.one/${controller.state.animeDetail.image?.original ?? "https://shikimori.one/system/mangas/original/23390.jpg?1693774603"}",
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width * 2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Description'.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: IText.text1Bold.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                child: Text(
                  controller.state.animeDetail.description ?? "",
                  maxLines: 8,
                  style: const TextStyle(
                      fontFamily: 'muli', color: AppColors.white),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Screenshots".toUpperCase(),
                style: IText.text1Bold.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
              ),
              ScreenshotWidget(controller: controller),
              Text(
                "Youtube".toUpperCase(),
                style: IText.text1Bold.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                ),
              ),
              YoutubeView(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
