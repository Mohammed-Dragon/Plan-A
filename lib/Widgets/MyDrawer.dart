import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Pages/2.dart';
import 'package:my_app/Pages/3.dart';
import 'package:my_app/Pages/4.dart';
import 'package:my_app/Pages/HomeScreen.dart';
import 'package:my_app/Themes/theme_provider.dart';
import 'package:my_app/Widgets/MyTile.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 2 / 3,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30,
              bottom: MediaQuery.of(context).size.height / 45,
              left: MediaQuery.of(context).size.height / 30,
              right: MediaQuery.of(context).size.height / 30,
            ),
            child: SizedBox(
              child: Image.asset("assets/1.png"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height / 70,
            ),
            child: Divider(
              thickness: 1,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          MyTile(
            icon: Icons.home,
            text: "Home Page",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          MyTile(
            icon: Icons.sell_rounded,
            text: "Book Services",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Number_2()),
              );
            },
          ),
          MyTile(
            icon: Icons.mail,
            text: "Subscription",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Number_3()),
              );
            },
          ),
          MyTile(
            icon: Icons.info,
            text: "Info Page",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Number_4()),
              );
            },
          ),
          ListTile(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            selectedTileColor: Colors.transparent,
            trailing: Switch(
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme(),
            ),
            leading: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? Icons.dark_mode
                  : Icons.light_mode,
              color: Colors.grey,
            ),
            title: Text(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? "Dark Mode"
                  : "Light Mode",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 25,
              ),
            ),
            onTap: () => Provider.of<ThemeProvider>(context, listen: false)
                .toggleTheme(),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height / 100,
            ),
            child: ListTile(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              selectedTileColor: Colors.transparent,
              leading: Icon(
                Icons.logout,
                size: MediaQuery.of(context).size.width / 17,
                color: Colors.grey,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 25,
                ),
              ),
              onTap: () {
                logOut();
              },
            ),
          )
        ],
      ),
    );
  }
}
