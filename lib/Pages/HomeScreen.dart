import 'package:flutter/material.dart';
import 'package:my_app/Widgets/MyDrawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(child: Text('1')),
    );
  }
}
