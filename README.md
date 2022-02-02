# Responsive Ui Builder


## Getting Started

The responsive ui builder package contains widgets that helps you to create your UI responsive.

![Responsive UI Builder Preview](https://raw.githubusercontent.com/drashti-kahodariya/Responsive-Ui-builder/main/example/assets/ezgif.com-gif-maker.gif)
## Installation

Add responsive_ui_builder as dependency to your pubspec file.

```
responsive_ui__builder:
```

## Usage

This package provides a widget called `ResponsiveUiBuilder` that provides you with a builder function that returns the current `ResponsiveUiSize`.  

### Responsive Builder

The `ResponsiveUiBuilder` is used as any other builder widget.

```dart
// import the package
import 'package:responsive_ui_builder/responsive_ui__builder.dart';

// Use the widget
ResponsiveUiBuilder(
            small: (context, sm) {
              return Container(
                color: Colors.red,
              );
            },
            medium: (context, md) {
              return Container(
                color: Colors.yellow,
              );
            },
            large: (context, lg) {
              return Container(
                color: Colors.green,
              );
            },
          );
```

This will return different colour containers depending on which device it's being shown on. A simple way to test this is to either run your code on Flutter web and resize the window.

## Custom Screen Breakpoints

If you wish to define your own custom break points you can do so by supplying e `ResponsiveUiBuilder` widgets with a `breakpoints` argument.

```dart
// import the package
import 'package:responsive_ui_builder/responsive_ui_builder.dart';
//ScreenTypeLayout with custom breakpoints supplied
ResponsiveUiBuilder(
            breakpoints:
                const ScreenBreakpoints(medium: 600, large: 950, small: 300),
            small: Container(color: Colors.blue),
            medium: Container(color: Colors.yellow),
            large: Container(color: Colors.red),
          ),
```



