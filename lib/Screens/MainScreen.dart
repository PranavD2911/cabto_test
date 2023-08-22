import 'package:cabto_test/Screens/CityCab.dart';
import 'package:cabto_test/Screens/NavBar.dart';
import 'package:cabto_test/Screens/Outstation.dart';
import 'package:cabto_test/Screens/Rental.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MainScreen extends StatefulWidget {
  static const String idscreen = "MainScreen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MapController _mapController = MapController();
  int _currentIndex = 0;
  List<Widget> _screens = [
    CityCab(),
    Rental(),
    OutStation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "CABTO",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "AlumniSans",
                fontSize: 35,
                color: Colors.black),
          )),
        ),
        drawer: const NavBar(),
        body: Stack(
          children: [
            Positioned.fill(child: _screens[_currentIndex]),
            Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height / 3.05,
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.car_repair_sharp), label: "CityCab"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.car_rental_outlined), label: "Rental"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "OutStation")
                  ],
                ))
          ],
        ));
  }
}
