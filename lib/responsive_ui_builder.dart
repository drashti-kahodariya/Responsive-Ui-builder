import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_ui_builder/sizing_information.dart';
import 'package:responsive_ui_builder/widget_builders.dart';

import 'package/responsive_ui_size.dart';

/// Signature for the individual builders (`small`, `medium`, `large`)
typedef WidgetBuilder = Widget Function(BuildContext);

/// {@template responsive_layout_builder}
/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
/// {@endtemplate}
class ResponsiveUiBuilder extends StatelessWidget {
  final ScreenBreakpoints? breakpoints;

  final WidgetBuilder? small;
  final WidgetBuilder? medium;
  final WidgetBuilder? large;

  ResponsiveUiBuilder({
    Key? key,
    this.breakpoints,
    Widget? small,
    Widget? medium,
    Widget? large,
  })  : this.small = _builderOrNull(small)!,
        this.medium = _builderOrNull(medium),
        this.large = _builderOrNull(large),
        super(key: key);

  const ResponsiveUiBuilder.builder({
    Key? key,
    this.breakpoints,
    required this.small,
    this.medium,
    this.large,
  }) : super(key: key);

  static WidgetBuilder? _builderOrNull(Widget? widget) {
    return widget == null ? null : ((_) => widget);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      breakpoints: breakpoints,
      builder: (context, sizingInformation) {
        /// if small perameter  passed then return small widget function ,If not passed small perameter then
        /// cheack if passed medium peramter then return medium widget function ,If not passed small and medium perameter then
        /// return large widget function
        if (sizingInformation.deviceScreenType == ResponsiveUiSize.small) {
          if (small != null) {
            return small!(context);
          } else if (medium != null) {
            return medium!(context);
          } else {
            return large!(context);
          }
        }

        /// if medium perameter  passed then return medium widget function ,If not passed medium perameter then
        /// cheack if passed large peramter then return large widget function ,If not passed large and medium perameter then
        /// return small widget function
        if (sizingInformation.deviceScreenType == ResponsiveUiSize.medium) {
          if (medium != null) {
            return medium!(context);
          } else if (large != null) {
            return large!(context);
          } else {
            return small!(context);
          }
        }

        /// if large perameter  passed then return large widget function ,If not passed large perameter then
        /// cheack if passed medium peramter then return medium widget function ,If not passed large and medium perameter then
        /// return small widget function
        return large != null
            ? large!(context)
            : medium != null
                ? medium!(context)
                : small!(context);
      },
    );
  }
}
