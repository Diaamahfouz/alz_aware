import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../theme/app_colors.dart';

class MediaPickerHelper {
  File? file;
  final picker = ImagePicker();

  Future<File?> imageCropper({
    required String sourcePath,
    required String title,
    CropStyle? cropStyle,
    CropAspectRatioPresetData? initAspectRatio,
  }) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: sourcePath,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: title,
            statusBarColor: AppColors.primerColor,
            toolbarColor: AppColors
                .primerColor, // Replace with AppColors.iconColor
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: true,
            cropStyle: cropStyle ?? CropStyle.rectangle,
            hideBottomControls: true,
            initAspectRatio:
                initAspectRatio ?? CropAspectRatioPreset.ratio16x9,
            aspectRatioPresets: [
              CropAspectRatioPreset.ratio16x9,
              if (initAspectRatio != null) initAspectRatio,
            ],
          ),
          IOSUiSettings(
            title: title,
            doneButtonTitle: "حفظ",
            cancelButtonTitle: "الغاء",
            aspectRatioLockEnabled: true,
            aspectRatioPickerButtonHidden: true,
            cropStyle: cropStyle ?? CropStyle.rectangle,
            aspectRatioLockDimensionSwapEnabled: true,
            aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
          ),
        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
    } catch (e) {
      debugPrint('Error cropping image: $e');
    }
    return null;
  }

  Future<File?> getImageFromCamera({
    required String title,
    CropStyle? cropStyle,
    CropAspectRatioPresetData? initAspectRatio,
  }) async {
    try {
      final XFile? imageCamera = await picker.pickImage(
        source: ImageSource.camera,
      );
      if (imageCamera != null) {
        return Platform.isWindows
            ? File(imageCamera.path)
            : await imageCropper(
                sourcePath: imageCamera.path,
                title: title,
                cropStyle: cropStyle,
                initAspectRatio: initAspectRatio,
              );
      }
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
    }
    return null;
  }

  Future<File?> getMedia({bool isVideoOnly = false}) async {
    try {
      final XFile? mediaFile = isVideoOnly
          ? await picker.pickVideo(source: ImageSource.gallery)
          : await picker.pickMedia();
      return mediaFile != null ? File(mediaFile.path) : null;
    } catch (e) {
      debugPrint('Error picking multi media: $e');
    }
    return null;
  }

  Future<List<File>?> getMultiMedia() async {
    try {
      final List<XFile> mediaFiles = await picker.pickMultipleMedia();
      if (mediaFiles.isNotEmpty) {
        return List.generate(
          mediaFiles.length,
          (index) => File(mediaFiles[index].path),
        );
      }
    } catch (e) {
      debugPrint('Error picking multi media: $e');
    }
    return null;
  }

  Future<File?> getImageFromGallery({
    required String title,
    CropStyle? cropStyle,
    CropAspectRatioPresetData? initAspectRatio,
  }) async {
    try {
      final XFile? imageGallery = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (imageGallery != null) {
        return Platform.isWindows
            ? File(imageGallery.path)
            : await imageCropper(
                sourcePath: imageGallery.path,
                title: title,
                cropStyle: cropStyle,
                initAspectRatio: initAspectRatio,
              );
      }
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
    }
    return null;
  }

  Future<List<File>?> getImagesFromGallery(
    String arabicTitle,
    String englishTitle,
    int? limit,
  ) async {
    try {
      if (limit != 1) {
        final List<XFile> imagesGallery = await picker.pickMultiImage(
          limit: limit,
        );
        if (imagesGallery.isNotEmpty) {
          return List.generate(
            imagesGallery.length,
            (index) => File(imagesGallery[index].path),
          );
        }
      } else {
        final XFile? imageGallery = await picker.pickImage(
          source: ImageSource.gallery,
        );
        if (imageGallery != null) {
          return [File(imageGallery.path)];
        }
      }
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
    }
    return null;
  }

  void showPhotoPickerBottomSheet({
    required BuildContext context,
    required Future<void> Function(File? image) updateImageFunction,
    required String title,
    CropStyle? cropStyle,
    CropAspectRatioPresetData? initAspectRatio,
  }) {
    final GoRouter router = GoRouter.of(context);

    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(maxWidth: 500),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 5,
            children: [
              ListTile(
                onTap: () async =>
                    await updateImageFunction(
                      await getImageFromGallery(
                        title: title,
                        cropStyle: cropStyle,
                        initAspectRatio: initAspectRatio,
                      ),
                    ).whenComplete(
                      () => router.canPop() ? router.pop() : null,
                    ),
                splashColor: AppColors.primerColorB32,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: const Icon(
                  Icons.photo_library_rounded,
                  color: AppColors.primerColor,
                ),
                title: Text("المعرض"),
              ),
              ListTile(
                onTap: () async =>
                    updateImageFunction(
                      await getImageFromCamera(
                        title: title,
                        cropStyle: cropStyle,
                        initAspectRatio: initAspectRatio,
                      ),
                    ).whenComplete(
                      () => router.canPop() ? router.pop() : null,
                    ),
                splashColor: AppColors.primerColorB32,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: const Icon(
                  Icons.camera_rounded,
                  color: AppColors.primerColor,
                ),
                title: Text("الكاميرا"),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
