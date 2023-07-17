import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
          backgroundColor: Colors.green,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),

        // Body
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: (_, index) {
                return Container(
                  color: randomColor(),
                  width: 500,
                  height: 500,
                );
              },
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        '$counter',
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      child: const Text('Click Me!'),
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
              backgroundColor: Colors.green,
            ),
          ],
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color randomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }
}
