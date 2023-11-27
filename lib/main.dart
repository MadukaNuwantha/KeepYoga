import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keepyoga/constants.dart';
import 'package:keepyoga/screens/splash_screen.dart';
import 'package:keepyoga/services/authentication_service.dart';
import 'package:keepyoga/services/lesson_service.dart';
import 'package:keepyoga/services/session_service.dart';
import 'package:keepyoga/size_config.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationService()),
        ChangeNotifierProvider(create: (_) => LessonService()),
        ChangeNotifierProvider(create: (_) => SessionService()),
      ],
      child: const KeepYoga(),
    ),
  );
}

class KeepYoga extends StatelessWidget {
  const KeepYoga({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: kLightSecondaryColor,
        statusBarColor: kLightSecondaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KeepYoga',
      theme: ThemeData(
        scaffoldBackgroundColor: kLightSecondaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
