import 'dart:io';
import 'package:alz_aware/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ImagePickerWithOutCopper {
  File? file;
  final picker = ImagePicker();

  Future<Map<String, dynamic>?> _processImage(Uint8List rawBytes,
      {String? fileName}) async {
    try {
      final decoded = img.decodeImage(rawBytes);
      if (decoded == null) return null;

      // Resize and compress
      final resized = img.copyResize(decoded, width: 1024); // max width
      final compressedBytes =
          Uint8List.fromList(img.encodeJpg(resized, quality: 85));

      File? tempFile;
      if (!kIsWeb) {
        final tempDir = await getTemporaryDirectory();
        final tempPath = p.join(tempDir.path,
            fileName ?? "image_${DateTime.now().millisecondsSinceEpoch}.jpg");
        tempFile = await File(tempPath).writeAsBytes(compressedBytes);
      }

      return {
        'file': tempFile,
        'bytes': compressedBytes,
        'fileName': fileName,
      };
    } catch (e) {
      debugPrint("Image processing error: $e");
      return null;
    }
  }

// Mobile: Camera
  Future<File?> getImageFromCamera() async {
    try {
      final XFile? picked = await picker.pickImage(source: ImageSource.camera);
      if (picked != null) {
        final bytes = await picked.readAsBytes();
        final result =
            await _processImage(bytes, fileName: p.basename(picked.path));
        return result?['file'] as File?;
      }
    } catch (e) {
      debugPrint('Camera error: $e');
    }
    return null;
  }

// Mobile: Gallery
  Future<File?> getImageFromGallery() async {
    try {
      final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        final bytes = await picked.readAsBytes();
        if (bytes.lengthInBytes <= 5 * 1024 * 1024) {
          // Return original bytes and fileName without compression
            final tempDir = await getTemporaryDirectory();
            final tempPath = p.join(tempDir.path, p.basename(picked.path));
            final tempFile = await File(tempPath).writeAsBytes(bytes);
            return tempFile;
        }
        final result =
            await _processImage(bytes, fileName: p.basename(picked.path));
        return result?['file'] as File?;
      }
    } catch (e) {
      debugPrint('Gallery error: $e');
    }
    return null;
  }

// Web: Pick and Resize
  Future<List<dynamic>> pickImageForWeb(BuildContext context) async {
    try {
      final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        final bytes = await picked.readAsBytes();
        // Check if image size is <= 5MB (5 * 1024 * 1024 bytes)
        if (bytes.lengthInBytes <= 5 * 1024 * 1024) {
          // Return original bytes and fileName without compression
          return [bytes, picked.name];
        }
        final result = await _processImage(bytes, fileName: picked.name);
        return [result?['bytes'], result?['fileName']];
      }
    } catch (e) {
      debugPrint('Web image picker error: $e');
    }
    return [];
  }

  // Future<File?> getImageFromCamera() async {
  //   try {
  //     final XFile? imageCamera =
  //         await picker.pickImage(source: ImageSource.camera);
  //     if (imageCamera != null) {
  //       return File(imageCamera.path);
  //     }
  //   } catch (e) {
  //     debugPrint('Error picking image from camera: $e');
  //   }
  //   return null;
  // }

  // Uint8List? bytes;
  // String? fileName;

  // Future<List<dynamic>> pickImageForWeb(BuildContext context) async {
  //   bytes = null;
  //   fileName = null;
  //   final XFile? imageGallery =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (imageGallery != null) {
  //     bytes = await imageGallery.readAsBytes();
  //     fileName = imageGallery.name;
  //     // print("imageGallery.path: ${bytes}");
  //     return [await imageGallery.readAsBytes(), fileName];
  //   }
  //   return [];
  // }

  // /// Picks an image from the gallery and crops it.
  // Future<File?> getImageFromGallery() async {
  //   try {
  //     final XFile? imageGallery =
  //         await picker.pickImage(source: ImageSource.gallery);
  //     if (imageGallery != null) {
  //       return File(imageGallery.path);
  //     }
  //   } catch (e) {
  //     debugPrint('Error picking image from gallery: $e');
  //   }
  //   return null;
  // }

  showPhotoPickerBottomSheet(
    BuildContext context,
    Future<void> Function(File? image) updateImageFunction,
  ) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async => await updateImageFunction(
                  await getImageFromGallery(),
                ),
                splashColor: AppColors.black12.withValues(alpha: 0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: const Icon(
                  Icons.photo_library_rounded,
                  color: AppColors.black12,
                ),
                title: Text(
                  "gallery".tr(),
                ),
              ),
              const SizedBox(height: 5),
              kIsWeb
                  ? const SizedBox.shrink()
                  : ListTile(
                      onTap: () async => updateImageFunction(
                        await getImageFromCamera(),
                      ),
                      splashColor: AppColors.black12.withValues(alpha: 0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: const Icon(
                        Icons.camera_rounded,
                        color: AppColors.black12,
                      ),
                      title: Text(
                        "camera".tr(),
                      ),
                    ),
              const SizedBox(height: 10)
            ],
          ),
        );
      },
    );
  }
}
