import 'dart:io';

import 'package:animehub/modules/detail/controller/anime_detail_controller.dart';
import 'package:animehub/modules/detail/widget/movie_detail_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimeDetailView extends GetView<AnimeDetailController> {
  const AnimeDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getAnimeDetail(int.parse(Get.parameters["animeId"] ?? ""));

    return WillPopScope(
      child: Scaffold(
        body: Obx(() => _buildDetailBody(context)),
      ),
      onWillPop: () async => true,
    );
  }

  Widget _buildDetailBody(BuildContext context) {
    return controller.state.isLoading
        ? Center(
            child: Platform.isAndroid
                ? const CircularProgressIndicator()
                : const CupertinoActivityIndicator(),
          )
        : AnimeDetailItem(controller: controller);
  }
}
