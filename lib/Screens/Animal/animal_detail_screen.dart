import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/ReusableWidget/reusable_image_with_shimmer.dart';
import 'animal_controller.dart';

class AnimalDetailsScreen extends GetView<AnimalController> {
  const AnimalDetailsScreen({
    super.key,
  });

  static const routeName = "/animalDetailsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height:
                  12,),
                ReusableImageWithShimmer(
                  url: controller.selectedAnimalName.value.imageIUrl,
                  height: Get.height * .30,
                  isCircle: false,
                  width: Get.width,
                  boxFit: BoxFit.cover,
                  borderRadius: 6,
                ),
                const SizedBox(height: 14),
                Text(
                  controller.selectedAnimalName.value.name,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Text(
                  controller.selectedAnimalName.value.description,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
