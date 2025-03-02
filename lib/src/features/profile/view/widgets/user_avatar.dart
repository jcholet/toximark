import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_pitstop/src/utils/utils.dart';

/// {@template user_avatar}
/// A widget that represents a user avatar.
/// {@endtemplate}
class UserAvatar extends StatelessWidget {
  /// {@macro user_avatar}
  const UserAvatar({
    required this.initials,
    this.radius = 50,
    this.imageUrl,
    this.imageFile,
    super.key,
  }) : assert(initials.length == 2, 'Initials must be exactly 2 characters.');

  /// The initials to display if no image is provided.
  final String initials;

  /// The radius of the avatar.
  final double radius;

  /// The URL of the image to display.
  final String? imageUrl;

  /// The file of the image to display.
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    final imageProvided = imageUrl != null || imageFile != null;
    return CircleAvatar(
      backgroundColor:
          imageProvided ? AppColor.transparent : AppColor.pastelGrey,
      radius: radius,
      child: imageProvided
          ? ClipOval(
              child: AspectRatio(
                aspectRatio: 1,
                child: imageUrl != null
                    ? Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                      ),
              ),
            )
          : Text(
              initials,
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: radius >= 90
                    ? AppTextStyle.displayLarge.fontSize! * 1.5
                    : null,
                color: AppColor.mediumGrey,
              ),
            ),
    );
  }
}
