import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:animehub/data/models/anime.dart';
import 'package:animehub/modules/home/controller/home_controller.dart';
import 'package:animehub/routes/app_pages.dart';
import 'package:animehub/utils/colors.style.dart';
import 'package:animehub/utils/texts.style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.controller, required this.anime})
      : super(key: key);

  final HomeController controller;
  final Anime anime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Get.toNamed(
          Routes.showAnimeDetail(anime.id ?? 0),
        ),
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(
                    child: Platform.isAndroid
                        ? const CircularProgressIndicator()
                        : const CupertinoActivityIndicator(),
                  ),
                  imageUrl:
                      "https://shikimori.one/${anime.image?.original ?? "https://shikimori.one/system/mangas/original/23390.jpg?1693774603"}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.0,
                    child: Text(
                      anime.name?.toUpperCase() ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: IText.header4Black.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'muli',
                        color: AppColors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  RichText(
                    text: TextSpan(
                      text: "Status",
                      style: IText.header4Black.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'muli',
                        color: AppColors.white,
                        fontSize: 12,
                      ),
                      children: [
                        const TextSpan(text: " : "),
                        TextSpan(
                          text: anime.status?.toUpperCase(),
                          style: IText.header4Black.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'muli',
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("${anime.score}",
                          style: IText.header4Black.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'muli',
                            color: AppColors.white,
                            fontSize: 12,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
