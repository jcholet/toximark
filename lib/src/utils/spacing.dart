import 'package:flutter/material.dart';
import 'package:tennaxia_geolocation/src/utils/utils.dart';

/// A widget that represents vertical spacing, allowing for consistent and
/// customizable vertical gaps in your app's layout.
class VSpace extends StatelessWidget {
  /// Creates a vertical space widget with a specified size.
  ///
  /// The [size] parameter determines the height of the vertical space.
  const VSpace._(this.size);

  /// Creates an extra-small vertical space (xxs).
  const VSpace.xxs() : this._(AppSpacing.xxs);

  /// Creates a very small vertical space (xs).
  const VSpace.xs() : this._(AppSpacing.xs);

  /// Creates a small vertical space (sm).
  const VSpace.sm() : this._(AppSpacing.sm);

  /// Creates a medium vertical space (md).
  const VSpace.md() : this._(AppSpacing.md);

  /// Creates a large vertical space (lg).
  const VSpace.lg() : this._(AppSpacing.lg);

  /// Creates an extra-large vertical space (xl).
  const VSpace.xl() : this._(AppSpacing.xl);

  /// Creates an extra-extra-large vertical space (xxl).
  const VSpace.xxl() : this._(AppSpacing.xxl);

  /// Creates an extra-extra-extra-large vertical space (xxxl).
  const VSpace.xxxl() : this._(AppSpacing.xxxl);

  /// The size of the vertical space.
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(height: size);
}

/// A widget that represents horizontal spacing, allowing for consistent and
/// customizable horizontal gaps in your app's layout.
class HSpace extends StatelessWidget {
  /// Creates a horizontal space widget with a specified size.
  ///
  /// The [size] parameter determines the width of the horizontal space.
  const HSpace._(this.size);

  /// Creates a very small horizontal space (xs).
  const HSpace.xs() : this._(AppSpacing.xs);

  /// Creates a small horizontal space (sm).
  const HSpace.sm() : this._(AppSpacing.sm);

  /// Creates a medium horizontal space (md).
  const HSpace.md() : this._(AppSpacing.md);

  /// Creates a large horizontal space (lg).
  const HSpace.lg() : this._(AppSpacing.lg);

  /// Creates an extra-large horizontal space (xl).
  const HSpace.xl() : this._(AppSpacing.xl);

  /// Creates an extra-extra-large horizontal space (xxl).
  const HSpace.xxl() : this._(AppSpacing.xxl);

  /// The size of the horizontal space.
  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(width: size);
}
