import 'package:flutter/material.dart';
import 'package:responsive_ui_builder/package/responsive_ui_size.dart';

/// Contains sizing information to make responsive choices for the current screen
class SizingInformation {
  final ResponsiveUiSize deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  bool get isMobile => deviceScreenType == ResponsiveUiSize.small;

  bool get isTablet => deviceScreenType == ResponsiveUiSize.medium;

  bool get isDesktop => deviceScreenType == ResponsiveUiSize.large;

  SizingInformation({
    required this.deviceScreenType,
    required this.screenSize,
    required this.localWidgetSize,
  });

  @override
  String toString() {
    return 'DeviceType:$deviceScreenType  ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}

/// Manually define screen resolution breakpoints
///
/// Overrides the defaults
class ScreenBreakpoints {
  final double small;
  final double medium;
  final double large;

  const ScreenBreakpoints({
    required this.large,
    required this.medium,
    required this.small,
  });

  @override
  String toString() {
    return "large: $large, medium: $medium, small: $small";
  }
}
