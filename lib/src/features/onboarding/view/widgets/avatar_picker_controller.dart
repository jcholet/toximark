import 'dart:io';

import 'package:health_pitstop/src/utils/utils.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'avatar_picker_controller.g.dart';

@riverpod
class AvatarPickerController extends _$AvatarPickerController {
  @override
  FutureOr<File?> build() {
    return null;
  }

  Future<void> pickImage() async {
    final currentAvatar = state.value;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // Open gallery to pick image
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        // Crop image
        final croppedImage = await ImageCropper().cropImage(
          sourcePath: image.path,
          maxWidth: 400,
          maxHeight: 400,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            IOSUiSettings(
              rotateButtonsHidden: true,
              resetButtonHidden: true,
              aspectRatioPickerButtonHidden: true,
              aspectRatioLockDimensionSwapEnabled: true,
              cropStyle: CropStyle.circle,
            ),
            AndroidUiSettings(
              toolbarTitle: '',
              toolbarColor: AppColor.dark,
              toolbarWidgetColor: AppColor.white,
              backgroundColor: AppColor.dark,
              hideBottomControls: true,
            ),
          ],
        );

        if (croppedImage != null) {
          return File(croppedImage.path);
        }
      }

      // If the user cancels the image picker, return the current avatar
      return currentAvatar;
    });
  }
}
