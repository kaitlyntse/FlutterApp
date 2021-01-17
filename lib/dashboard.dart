import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'checklistReader.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final FirebaseMessaging _messaging = FirebaseMessaging();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _messaging.getToken().then((token) {
      print(token);
    });
  }

  Widget getPage(int index) {
    if (index == 0) {
      return DynamicallyCheckbox();
    } else if (index == 1) {
      return null;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return new Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Row(
        children: <Widget>[
          // NavigationRail(
          //   selectedIndex: _selectedIndex,
          //   onDestinationSelected: (int index) {
          //     setState(() {
          //       _selectedIndex = index;
          //     });
          //   },
          //   labelType: NavigationRailLabelType.selected,
          //   destinations: [
          //     NavigationRailDestination(
          //       icon: Icon(Icons.favorite_border),
          //       selectedIcon: Icon(Icons.favorite),
          //       label: Text('Home'),
          //     ),
          //     NavigationRailDestination(
          //       icon: Icon(Icons.bookmark_border),
          //       selectedIcon: Icon(Icons.book),
          //       label: Text('Second'),
          //     ),
          //     NavigationRailDestination(
          //       icon: Icon(Icons.star_border),
          //       selectedIcon: Icon(Icons.star),
          //       label: Text('Third'),
          //     ),
          //   ],
          // ),
          // VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.red])),
            child: Center(child: getPage(_selectedIndex)),
          )),
          /*Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.red])),
            child: Center(
              child: Text(
                'Hello Gradient!',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
