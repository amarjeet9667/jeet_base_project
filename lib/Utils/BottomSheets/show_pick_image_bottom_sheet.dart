import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CommonController/image_picker_controller.dart';
import '../ReusableWidget/reusable_snackbar.dart';
import '../image_path.dart';



var imageController = Get.find<ImagePickerController>();

showPickImageBottomSheet({
  required BuildContext context,
  required void Function (String selectedPath) setImagePath,
}) async {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26.0),
            topRight: Radius.circular(26.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        child: Column(children: [
          const SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () async {
              await imageController.pickImageFromCamera().then((value) async {
                if (value != null) {
                  setImagePath(value);
                } else {
                  showSnackBar(
                      message: "Please Pick Image",
                      duration: 3,
                      isForError: true);
                }
              });
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    size: 26,
                    color: Color(0xff5EBDE2),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                      color: Color(0xff444444),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Divider(
            color: Color(0xffE0E0E0),
            thickness: 1.5,
          ),
          const SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: (() async {
              await imageController.pickImageFromGallery().then((value) async {
                if (value != null) {

                  setImagePath(value);

                  // await uploadImageController.upload(
                  //     imageController.image.value, context);
                  // imageController.imageUrl.value = uploadImageController
                  //         .uploadImageModel.value.path![0].location ??
                  //     "";
                } else {
                  showSnackBar(
                      message: "Please Pick Image",
                      duration: 3,
                      isForError: true);
                }
              });
            }),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.perm_media,
                    size: 26,
                    color: Color(0xff5EBDE2),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Text(
                    "Upload from Gallery",
                    style: TextStyle(
                      color: Color(0xff444444),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Divider(
            color: Color(0xffE0E0E0),
            thickness: 1.5,
          ),
          const SizedBox(
            height: 7,
          ),
          InkWell(
            onTap: () {
              Get.back();
              //  showAvatarBottomSheet(context, GetAvatar(), imageController);
            },
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(ImagePath.selectAvatarIcon),
                ),
                const SizedBox(
                  width: 22,
                ),
                const Text(
                  "Choose Avatar",
                  style: TextStyle(
                    color: Color(0xff444444),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          ),
        ]),
      ),
    ),
  );
}

List<String> avatarList = [];

