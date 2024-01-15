import 'package:animehub/core/utils/size_config.dart';
import 'package:animehub/data/models/anime.dart';
import 'package:animehub/modules/home/controller/home_controller.dart';
import 'package:animehub/modules/home/widgets/card_item.dart';
import 'package:animehub/shared/ui/circular_progress.dart';
import 'package:animehub/utils/colors.style.dart';
import 'package:animehub/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      initState: (_) async {
        controller.fetchAnime();
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              "AnimeHub",
              style: AppTheme.lightAppBarTheme.titleTextStyle!.copyWith(
                color: AppColors.black,
                fontFamily: 'muli',
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Obx(
              () => controller.state.isLoading
                  ? const CircularProgress()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.state.animeList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Anime anime = controller.state.animeList[index];
                        return CardItem(
                          controller: controller,
                          anime: anime,
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
