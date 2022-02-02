import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_ui_builder/package/responsive_ui_size.dart';
import 'package:responsive_ui_builder/sizing_information.dart';

ResponsiveUiSize getDeviceType(
  Size size, [
  ScreenBreakpoints? breakpoint,
]) {
  double deviceWidth = size.shortestSide;

  if (kIsWeb) {
    deviceWidth = size.width;
  }

  // Replaces the defaults with the user defined definitions
  if (breakpoint != null) {
    if (deviceWidth > breakpoint.large) {
      return ResponsiveUiSize.large;
    }

    if (deviceWidth > breakpoint.medium) {
      return ResponsiveUiSize.medium;
    }

    if (deviceWidth < breakpoint.small) {
      return ResponsiveUiSize.small;
    }
  } else {
    // If no user defined definitions are passed through use the defaults
    if (deviceWidth >= breakpoint!.large) {
      return ResponsiveUiSize.large;
    }

    if (deviceWidth >= breakpoint.medium) {
      return ResponsiveUiSize.medium;
    }

    if (deviceWidth < breakpoint.small) {
      return ResponsiveUiSize.small;
    }
  }

  return ResponsiveUiSize.small;
}
