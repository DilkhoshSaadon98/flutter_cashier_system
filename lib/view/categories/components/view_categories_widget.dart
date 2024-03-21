import 'package:cashier_system/controller/catagories/catagories_view_controller.dart';
import 'package:cashier_system/core/constant/app_theme.dart';
import 'package:cashier_system/core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cashier_system/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomShowCatagories extends StatelessWidget {
  const CustomShowCatagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CatagoriesController());
    return Container(
      color: white,
      height: Get.height,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: GetBuilder<CatagoriesController>(builder: (controller) {
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Get.width > 1200
                    ? 8
                    : Get.width > 900
                        ? 5
                        : Get.width > 500
                            ? 3
                            : 1,
                mainAxisSpacing: 15,
                childAspectRatio: .7.h,
                crossAxisSpacing: 15),
            itemCount: !controller.isSearch
                ? controller.data.length
                : controller.listdataSearch.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: GestureDetector(
                  onTap: () {
                    controller.goUpdate(controller.data[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: primaryColor,
                              blurRadius: 1,
                              blurStyle: BlurStyle.inner,
                              offset: const Offset(1, 1))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CachedNetworkImage(
                            height: 125,
                            width: 125,
                            imageUrl: !controller.isSearch
                                ? "${AppLink.imagestCategories}/${controller.data[index].categoriesImage}"
                                : "${AppLink.imagestCategories}/${controller.listdataSearch[index].categoriesImage}"),
                        Text(
                          !controller.isSearch
                              ? controller.data[index].categoriesName!
                              : controller
                                  .listdataSearch[index].categoriesName!,
                          style: titleStyle.copyWith(),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
