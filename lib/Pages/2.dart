import 'package:flutter/material.dart';
import 'package:my_app/Widgets/MyDrawer.dart';

class Number_2 extends StatelessWidget {
  const Number_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Center(child: Text('2')),
    );
  }
}
