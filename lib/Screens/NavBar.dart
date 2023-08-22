import 'package:cabto_test/Screens/CityCab.dart';
import 'package:cabto_test/Screens/Outstation.dart';
import 'package:cabto_test/Screens/Rental.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  static const String idscreen = "NavBar";

  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
              accountName: Text("Test1"),
              accountEmail: Text("test@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/Images/profile.jpg'),
              )),
          ListTile(
            leading: const Icon(Icons.car_repair_sharp),
            title: const Text("CityCab"),
            onTap: () => CityCab(),
          ),
          ListTile(
            leading: const Icon(Icons.car_rental_outlined),
            title: const Text("Rental"),
            onTap: () => Rental(),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("OutStation"),
            onTap: () => OutStation(),
          ),
          ListTile(
            leading: const Icon(Icons.access_time_outlined),
            title: const Text("Your Activity"),
            onTap: () => OutStation(),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About App"),
            onTap: () => OutStation(),
          )
        ],
      ),
    );
  }
}
