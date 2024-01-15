import 'dart:io';

import 'package:animehub/modules/detail/controller/anime_detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/anime_detail.dart';

class YoutubeView extends StatelessWidget {
  const YoutubeView({super.key, required this.controller});

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
        itemCount: controller.state.animeDetail.videos!.length,
        itemBuilder: (context, index) {
          Videos image = controller.state.animeDetail.videos![index];
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(
                    child: Platform.isAndroid
                        ? const CircularProgressIndicator()
                        : const CupertinoActivityIndicator(),
                  ),
                  imageUrl: image.imageUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    controller.launchYoutubeVideo(image.playerUrl ?? "");
                  },
                  child: const Icon(
                    Icons.play_circle_outline,
                    color: Colors.yellow,
                    size: 65,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
