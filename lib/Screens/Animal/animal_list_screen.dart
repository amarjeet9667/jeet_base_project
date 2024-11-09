import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/ReusableWidget/reusable_image_with_shimmer.dart';
import 'animal_controller.dart';
import 'animal_detail_screen.dart';

class AnimalListScreen extends GetView<AnimalController> {
  const AnimalListScreen({super.key});

  static const routeName = "/animalListScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
              itemCount: controller.animals.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ReusableImageWithShimmer(
                    url: controller.animals[index].imageIUrl,
                    boxFit: BoxFit.cover,
                    height: 50,
                  ),
                  title: Text(
                    controller.animals[index].name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    controller.animals[index].description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  onTap: () {
                    controller.selectedAnimalName.value =
                        controller.animals[index];
                    Get.toNamed(
                      AnimalDetailsScreen.routeName,
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return index != controller.animals.length - 1
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: .7,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
