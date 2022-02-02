import 'package:flutter/material.dart';
import 'package:responsive_ui_builder/responsive_ui_builder.dart';
import 'package:responsive_ui_builder/sizing_information.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Responsive Layout Builder'),
        ),
        body: Center(
          /// should be pass atleast one peramamerter or more perameter in ResponsiveLayoutBuilder
          child: ResponsiveUiBuilder(
            breakpoints:
                const ScreenBreakpoints(medium: 600, large: 950, small: 300),
            small: Container(color: Colors.blue),
            medium: Container(color: Colors.yellow),
            large: Container(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
