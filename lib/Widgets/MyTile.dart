import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;

  const MyTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      selectedTileColor: Colors.transparent,
      leading: Icon(
        size: MediaQuery.of(context).size.width / 17,
        icon,
        color: Colors.grey,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 25,
        ),
      ),
      onTap: onTap,
    );
  }
}
