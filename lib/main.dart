import 'package:cabto_test/bloc/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationCubit>(
      create: (context)=> LocationCubit()..getLocation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.yellow,
            iconTheme: IconThemeData(color: Colors.black)
          ),
          fontFamily: "Inter",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          // useMaterial3: true,
        ),
        home: MainScreen(),
      ),
    );
  }
}
