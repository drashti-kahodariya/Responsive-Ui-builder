import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_ui_builder/responsive_ui_builder.dart';

void main() {
  const MethodChannel channel = MethodChannel('responsive_ui_builder');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ResponsiveUiBuilder.platformVersion, '42');
  });
}
