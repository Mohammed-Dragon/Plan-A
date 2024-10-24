import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Pages/Splash.dart';
import 'package:my_app/Themes/dark_mode.dart';
import 'package:my_app/Themes/light_mode.dart';
import 'package:my_app/Themes/theme_provider.dart';
import 'package:my_app/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final themeProvider = ThemeProvider();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => themeProvider,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    ThemeData themeData = themeProvider.isDarkMode ? darkMode : lightMode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: themeData,
    );
  }
}
