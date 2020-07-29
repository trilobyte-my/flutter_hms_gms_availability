import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hms_gms_availability/flutter_hms_gms_availability.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_hms_gms_availability');

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
    expect(await FlutterHmsGmsAvailability.platformVersion, '42');
  });
}
