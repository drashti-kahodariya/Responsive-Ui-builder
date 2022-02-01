import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'breakpoints.dart';
import 'package/responsive_ui_size.dart';

/// Signature for the individual builders (`small`, `medium`, `large`)
typedef ResponsiveUiWidgetBuilder = Widget Function(BuildContext, Widget?);

/// {@template responsive_layout_builder}
/// A wrapper around [LayoutBuilder] which exposes builders for
/// various responsive breakpoints.
/// {@endtemplate}
class ResponsiveUiBuilder extends StatelessWidget {
  /// {@macro responsive_layout_builder}
  const ResponsiveUiBuilder({
    Key? key,
    this.small,
    this.medium,
    this.large,
    this.child,
  }) : super(key: key);

  /// [ResponsiveUiWidgetBuilder] for small layout.
  final ResponsiveUiWidgetBuilder? small;

  /// [ResponsiveUiWidgetBuilder] for medium layout.
  final ResponsiveUiWidgetBuilder? medium;

  /// [ResponsiveUiWidgetBuilder] for large layout.
  final ResponsiveUiWidgetBuilder? large;

  /// Optional child widget builder based on the current layout size
  /// which will be passed to the `small`, `medium` and `large` builders
  /// as a way to share/optimize shared layout.
  final Widget Function(ResponsiveUiSize currentSize)? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        /// Get ScreenWidth
        final screenWidth = MediaQuery.of(context).size.width;

        /// if small perameter  passed then return small widget function ,If not passed small perameter then
        /// cheack if passed medium peramter then return medium widget function ,If not passed small and medium perameter then
        /// return large widget function
        if (screenWidth <= ResponsiveUiBreakpoints.small) {
          if (small != null) {
            return small!(context, child?.call(ResponsiveUiSize.small));
          } else if (medium != null) {
            return medium!(context, child?.call(ResponsiveUiSize.medium));
          } else {
            return large!(context, child?.call(ResponsiveUiSize.large));
          }
        }

        /// if medium perameter  passed then return medium widget function ,If not passed medium perameter then
        /// cheack if passed large peramter then return large widget function ,If not passed large and medium perameter then
        /// return small widget function
        if (screenWidth <= ResponsiveUiBreakpoints.medium) {
          if (medium != null) {
            return medium!(context, child?.call(ResponsiveUiSize.medium));
          } else if (large != null) {
            return large!(context, child?.call(ResponsiveUiSize.large));
          } else {
            return small!(context, child?.call(ResponsiveUiSize.small));
          }
        }

        /// if large perameter  passed then return large widget function ,If not passed large perameter then
        /// cheack if passed medium peramter then return medium widget function ,If not passed large and medium perameter then
        /// return small widget function
        return large != null
            ? large!(context, child?.call(ResponsiveUiSize.large))
            : medium != null
                ? medium!(context, child?.call(ResponsiveUiSize.medium))
                : small!(context, child?.call(ResponsiveUiSize.small));
      },
    );
  }
}
