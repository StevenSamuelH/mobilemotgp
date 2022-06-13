import 'dart:io';

import 'package:flutter/material.dart';
import 'Produk/homeproduk.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  final screens = [
    const Awalan(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Image.network(
                'https://w7.pngwing.com/pngs/170/729/png-transparent-moto-gp-hd-logo.png'),
            onPressed: () => exit(0),
          ),
        ],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method and use it to set our appbar title.
        backgroundColor: Colors.white,
        title: const Text(
          'MotoGP Merchandise',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              height: 1.6,
              fontFamily: 'Open Sans',
              fontSize: 20),
        ),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Produk',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Review',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Penjual',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
