# Responsiveu Ui Builder


## Getting Started

The responsive ui builder package contains widgets that helps you to craete your UI responsive.


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
# Responsive-Ui-builder
# Responsive-Ui-builder
