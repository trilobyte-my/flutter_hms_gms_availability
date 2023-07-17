import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_hms_gms_availability_example/main.dart';

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

  testWidgets('Verify Platform version', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    expect(
      find.text('GMS Available:  true\nHMS Available:  false'),
      findsOneWidget,
    );
  });
}
