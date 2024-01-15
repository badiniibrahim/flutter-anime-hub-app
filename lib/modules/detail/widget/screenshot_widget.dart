import 'dart:io';

import 'package:animehub/data/models/anime_detail.dart';
import 'package:animehub/modules/detail/controller/anime_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenshotWidget extends StatelessWidget {
  const ScreenshotWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimeDetailController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.state.animeDetail.screenshots!.length,
        itemBuilder: (context, index) {
          Screenshots image = controller.state.animeDetail.screenshots![index];
          return Card(
            elevation: 3,
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator()
                      : const CupertinoActivityIndicator(),
                ),
                imageUrl:
                    "https://shikimori.one/${image.original ?? "https://shikimori.one/system/mangas/original/23390.jpg?1693774603"}",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
