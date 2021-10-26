import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int pageIndex = 0; // 0 - first home page by default
  int counter = 0;
  List<Widget> pages = [];
  TabController? controller;

  _MyHomePageState() {
    pages = [
      Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            'Your page is White',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
      Container(
        color: Colors.green,
        child: const Center(
          child: Text(
            'Your page is Green',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Container(
        color: Colors.lightBlue,
        child: const Center(
          child: Text(
            'Your page is Blue',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
      Container(
        color: Colors.deepPurple,
        child: const Center(
          child: Text(
            'Your page is Purple',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      )
    ];

    controller = TabController(vsync: this, length: pages.length);
    controller!.addListener(() {
      setState(() {
        pageIndex = controller!.index;
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      counter++;
      pages = pages;
    });
  }

  void _clearCounter() {
    setState(() {
      counter = 0;
    });
  }

  void _changeWindow(int i) {
    setState(() {
      pageIndex = i;
      controller!.animateTo(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('You clicked $counter times'),
            IconButton(
                onPressed: _clearCounter,
                icon: const Icon(Icons.delete_forever))
          ],
        ),
      ),
      drawer: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        constraints: const BoxConstraints(maxWidth: 250),
        child: ListView(
          children: const [
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.account_circle_rounded),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            ),
            ListTile(
              title: Text('Main Text'),
              subtitle: Text('Subtitle Text'),
              leading: Icon(Icons.add),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller!,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: _changeWindow,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              label: 'First window',
              icon: Icon(Icons.looks_one)),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              label: 'Second window',
              icon: Icon(Icons.looks_two)),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              label: 'Third window',
              icon: Icon(Icons.looks_3)),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              label: 'Fourth window',
              icon: Icon(Icons.looks_4))
        ],
      ),
    );
  }
}
