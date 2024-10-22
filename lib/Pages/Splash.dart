import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Pages/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final googleLoggedIn = prefs.getBool('google_logedin') ?? false;
      final phoneLoggedIn = prefs.getBool('phone_logedin') ?? false;

      setState(() {
        _isLoggedIn = googleLoggedIn || phoneLoggedIn;
      });

      await Future.delayed(const Duration(seconds: 3));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => _isLoggedIn ? const HomeScreen() : HomeScreen(),
        ),
      );
    } catch (e) {
      print("Error in _initialize: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color(0xff242C3B),
          ),
          Padding(
            padding: const EdgeInsets.all(65),
            child: SizedBox(
              child: Image.asset("assets/1.png"),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 0, 38, 174),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Events That Don't Need A Plan B",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
