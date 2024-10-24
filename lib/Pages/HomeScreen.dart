import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/Themes/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 2 / 3,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 18,
                bottom: MediaQuery.of(context).size.height / 30,
                left: MediaQuery.of(context).size.height / 18,
                right: MediaQuery.of(context).size.height / 18,
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
            ListTile(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              selectedTileColor: Colors.transparent,
              leading: Icon(
                size: MediaQuery.of(context).size.width / 17,
                Icons.home,
                color: Colors.grey,
              ),
              title: Text(
                "Home Page",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 25,
                ),
              ),
              onTap: () => Navigator.pop(context),
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
      ),
    );
  }
}
