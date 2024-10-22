import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Function onLocationPermissionDenied;
  final Function openChatbotPage;

  ProfilePage(
      {required this.onLocationPermissionDenied,
      required this.openChatbotPage});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
