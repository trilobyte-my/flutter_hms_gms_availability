# flutter_hms_gms_availability

Based on the posting by @Salman Yakoob
https://medium.com/@salman.yaqoob.1985

Medium post

https://medium.com/huawei-developers/flutter-check-hms-gms-availability-10f06aeea387

## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_hms_gms_availability/flutter_hms_gms_availability.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool gms = false, hms = false;

  @override
  void initState() {
    super.initState();
    FlutterHmsGmsAvailability.isGmsAvailable.then((t) {
      setState(() {
        gms = t;
      });
    });
    FlutterHmsGmsAvailability.isHmsAvailable.then((t) {
      setState(() {
        hms = t;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HMS/GMS Availability'),
        ),
        body: Center(
          child: Text('GMS Available:  $gms\nHMS Available:  $hms'),
        ),
      ),
    );
  }
}
```
