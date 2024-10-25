import 'package:flutter/material.dart';
import 'package:my_app/Widgets/MyDrawer.dart';

class Number_4 extends StatelessWidget {
  const Number_4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(child: Text('4')),
    );
  }
}
