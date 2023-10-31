import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hms_gms_availability/flutter_hms_gms_availability.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_hms_gms_availability');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'isGmsAvailable':
          return true;
        case 'isHmsAvailable':
          return false;
        default:
          throw MissingPluginException();
      }
    });
  });

  test('isHmsAvailable', () async {
    expect(await FlutterHmsGmsAvailability.isHmsAvailable, false);
  });

  test('isGmsAvailable', () async {
    expect(await FlutterHmsGmsAvailability.isGmsAvailable, true);
  });
}
