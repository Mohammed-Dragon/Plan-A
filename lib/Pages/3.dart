import 'package:flutter/material.dart';
import 'package:my_app/Widgets/MyDrawer.dart';

class Number_3 extends StatelessWidget {
  const Number_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(child: Text('3')),
    );
  }
}
