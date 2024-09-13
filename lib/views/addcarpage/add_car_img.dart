import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yakit_asistan/providers/all_providers.dart';
import 'package:yakit_asistan/tools/color_helper.dart';
import 'package:yakit_asistan/tools/text_style_helper.dart';
import 'package:yakit_asistan/views/commonwidgets/photo_picker.dart';

class AddCarImgButton extends ConsumerStatefulWidget {
  const AddCarImgButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddCarImgButtonState();
}

//*** Veritabanı araç resmi ekleme - Veritabanı araç resmi güncelleme
class _AddCarImgButtonState extends ConsumerState<AddCarImgButton> {
  @override
  Widget build(BuildContext context) {
    ref.watch(currentImageProvider);
    String imgUrl = ref.read(addCarProvider).imageUrl;
    bool isEditCar = ref.read(isEditCarProvider);
    if (isEditCar) {
      imgUrl = ref.read(detailPageSelectedCarProvider).imageUrl;
      ref.read(addCarProvider.notifier).state.imageUrl = imgUrl;
    }
    return InkWell(
      onTap: () async {
        await PhotoPicker.showPhotoPicker(
            context: context,
            ref: ref,
            onCameraPressed: () async {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              await PhotoPicker.getImage(source: ImageSource.camera, ref: ref);
              if (isEditCar) {
                debugPrint("resim Güncellendi!");
                ref
                    .read(detailPageSelectedCarProvider.notifier)
                    .state
                    .imageUrl = ref.read(currentImageProvider).path;
              } else {
                ref.read(addCarProvider.notifier).state.imageUrl =
                    ref.read(currentImageProvider).path;
                debugPrint("resim eklendi!");
              }
              ref.read(addCarProvider.notifier).state.imageUrl =
                  ref.read(currentImageProvider).path;
              debugPrint(ref.read(currentImageProvider).path);
            },
            onGalleryPressed: () async {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              await PhotoPicker.getImage(source: ImageSource.gallery, ref: ref);
              if (isEditCar) {
                debugPrint("resim Güncellendi!");
                ref
                    .read(detailPageSelectedCarProvider.notifier)
                    .state
                    .imageUrl = ref.read(currentImageProvider).path;
              } else {
                ref.read(addCarProvider.notifier).state.imageUrl =
                    ref.read(currentImageProvider).path;
                debugPrint("resim eklendi!");
              }
              ref.read(addCarProvider.notifier).state.imageUrl =
                  ref.read(currentImageProvider).path;
              debugPrint(ref.read(currentImageProvider).path);
            });

        setState(() {});
      },
      borderRadius: BorderRadius.circular(80),
      splashColor: ColorUiHelper.appSecondColor,
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorUiHelper.appBgColor,
          image: DecorationImage(
              image: (imgUrl == "assets/icons/addCarIcon.png")
                  ? AssetImage(imgUrl)
                  : (imgUrl.contains("https") == true
                      ? NetworkImage(imgUrl) as ImageProvider
                      : FileImage(File(imgUrl))),
              fit: (imgUrl == "assets/icons/addCarIcon.png")
                  ? BoxFit.scaleDown
                  : BoxFit.fill),
          boxShadow: [
            BoxShadow(
                color: ColorUiHelper.appSecondColor.withOpacity(1),
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: const Offset(0, 0)),
          ],
        ),
        child: (imgUrl == "assets/icons/addCarIcon.png")
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Text(
                    "Resim Ekle",
                    style: TextStyleHelper.addCarInputsLabel,
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
