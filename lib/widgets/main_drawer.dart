import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';


class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> aboutBoxChildren = <Widget>[
      const SizedBox(
        height: 20,
      ),
      const Text('GitHub: https://github.com/BLKKKBVSIK'),
      const Text('Website: https://enzoconty.dev'),
    ];

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.12,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: (MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.04,
            ),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking !',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.02,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          }),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AboutListTile(
                child: Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: Icon(
                  Icons.info,
                ),
                applicationIcon: Icon(
                  Icons.local_play,
                  size: 65,
                  color: Theme.of(context).accentColor,
                ),
                applicationName: 'MealApp',
                applicationVersion: '1.0.0',
                applicationLegalese: 'by Enzo CONTY',
                aboutBoxChildren: aboutBoxChildren,
              ),
            ),
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.03,
          )
        ],
      ),
    );
  }
}
