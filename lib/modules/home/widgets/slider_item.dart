import 'package:animehub/data/models/anime.dart';
import 'package:animehub/modules/home/controller/home_controller.dart';
import 'package:animehub/utils/texts.style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final HomeController controller;

  const SliderItem({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        CarouselSlider.builder(
          itemCount: controller.state.animeList.length,
          itemBuilder: (context, index, realIdx) {
            Anime anime = controller.state.animeList[index];
            return GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    // ignore: sort_child_properties_last
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://shikimori.one/${anime.image?.original ?? "https://shikimori.one/system/mangas/original/23390.jpg?1693774603"}",
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                      left: 15,
                    ),
                    child: Text(
                      anime.name ?? "",
                      style: IText.labelStyle.copyWith(
                        fontFamily: 'muli',
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: true,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}
