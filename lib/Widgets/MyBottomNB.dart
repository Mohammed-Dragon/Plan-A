import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/Pages/2.dart';
import 'package:my_app/Pages/3.dart';
import 'package:my_app/Pages/4.dart';
import 'package:my_app/Pages/HomeScreen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Number_2(),
    const Number_3(),
    const Number_4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 2 / 3,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 15,
              ),
              child: Text(
                'Habit Tracker',
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: MediaQuery.of(context).size.width / 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 50,
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
            /*ListTile(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                selectedTileColor: Colors.transparent,
                trailing: Switch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode,
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(colorProvider),
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
                    .toggleTheme(colorProvider),
              ),*/
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
                  "Exit",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 25,
                  ),
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Get In',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 173, 181),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list_alt),
            label: 'Filters',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 169, 68),
        unselectedItemColor: Color.fromARGB(255, 12, 123, 202),
        backgroundColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
