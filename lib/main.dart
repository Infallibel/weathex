import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weathex/pages/loadingpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const SafeArea(
        child: Material(
          child: LoadingPage(),
        ),
      ),
    );
  }
}

//TODO check if the app updates at 1 am
