import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(CupertinoVsMaterialApp());
}

class CupertinoVsMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino and Material Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Material Widgets",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MaterialTabBarExample()),
              ),
              child: Text('Show Material Tab Bar'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showMaterialContextMenu(context),
              child: Text('Show Material Context Menu'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showMaterialTimePicker(context),
              child: Text('Show Material Time Picker'),
            ),
            SizedBox(height: 20),
            Text(
              "Cupertino Widgets",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => CupertinoTabBarExample()),
              ),
              child: Text('Show Cupertino Tab Bar'),
            ),
            SizedBox(height: 10),
            CupertinoButton(
              onPressed: () => showCupertinoContextMenu(context),
              child: Text('Show Cupertino Context Menu'),
            ),
            SizedBox(height: 10),
            CupertinoButton(
              onPressed: () => showCupertinoTimerPicker(context),
              child: Text('Show Cupertino Timer Picker'),
            ),
          ],
        ),
      ),
    );
  }

  // Material Widgets

  void showMaterialContextMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Context Menu"),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(Icons.copy),
                  SizedBox(width: 8),
                  Text("Copy"),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 8),
                  Text("Share"),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 8),
                  Text("Favorite"),
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text("Delete", style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void showMaterialTimePicker(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      print("Selected Time: ${selectedTime.format(context)}");
    }
  }

  // Cupertino Widgets

  void showCupertinoContextMenu(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text("Context Menu"),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(CupertinoIcons.doc_on_clipboard),
                  SizedBox(width: 8),
                  Text("Copy"),
                ],
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(CupertinoIcons.share),
                  SizedBox(width: 8),
                  Text("Share"),
                ],
              ),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(CupertinoIcons.heart),
                  SizedBox(width: 8),
                  Text("Favorite"),
                ],
              ),
            ),
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(CupertinoIcons.delete, color: CupertinoColors.destructiveRed),
                  SizedBox(width: 8),
                  Text("Delete", style: TextStyle(color: CupertinoColors.destructiveRed)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void showCupertinoTimerPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: 250,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            initialTimerDuration: Duration(hours: 1, minutes: 30),
            onTimerDurationChanged: (Duration newDuration) {
              print("Selected Duration: $newDuration");
            },
          ),
        );
      },
    );
  }
}

// Cupertino Tab Bar Example
class CupertinoTabBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_fill),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock_solid),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
            label: 'Keypad',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: Text(
                'Content of tab $index',
                style: TextStyle(fontSize: 18),
              ),
            );
          },
        );
      },
    );
  }
}

// Material Tab Bar Example
class MaterialTabBarExample extends StatefulWidget {
  @override
  _MaterialTabBarExampleState createState() => _MaterialTabBarExampleState();
}

class _MaterialTabBarExampleState extends State<MaterialTabBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _tabContents = <Widget>[
    Center(child: Text('Content of tab 0', style: TextStyle(fontSize: 18))),
    Center(child: Text('Content of tab 1', style: TextStyle(fontSize: 18))),
    Center(child: Text('Content of tab 2', style: TextStyle(fontSize: 18))),
    Center(child: Text('Content of tab 3', style: TextStyle(fontSize: 18))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Material Tab Bar")),
      body: _tabContents[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Keypad',
          ),
        ],
      ),
    );
  }
}
