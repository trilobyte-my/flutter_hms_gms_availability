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
