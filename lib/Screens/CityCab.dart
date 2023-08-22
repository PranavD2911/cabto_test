import 'dart:async';

import 'package:cabto_test/Screens/Rental.dart';
import 'package:cabto_test/bloc/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CityCab extends StatefulWidget {
  static const String idscreen = "CityCab";

  const CityCab({super.key});

  @override
  State<CityCab> createState() => _CityCabState();
}

class _CityCabState extends State<CityCab> {
  final MapController _mapController = MapController();

  late Completer<MapController> controllerCompleter = Completer();

  void _onMapCreated(MapController _mapController) async {
    controllerCompleter.complete(_mapController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            BlocListener<LocationCubit, LocationState>(
                listener: (previousState, currentState) {
                  if (currentState is LocationError) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Error fetching Location")));
                  }

                  if (currentState is LocationLoaded) {
                    _mapController.onReady.then((value) => _mapController.move(
                        LatLng(currentState.latitude, currentState.longitude),
                        15));
                  }
                },
                child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      center: LatLng(18.734900, 73.672096),
                      zoom: 15,
                      maxZoom: 17,
                      minZoom: 3.5,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        retinaMode: true,
                      ),
                    ])),
            Positioned(
              right: 0,
              top: 15,
              left: 0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  color: Colors.white38,
                  child: const TextField(
                    decoration: InputDecoration(
                        filled: true,
                        focusColor: Colors.grey,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: "Destination",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                    height: 300.0,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 16,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 16,
                                        spreadRadius: 0.5,
                                        offset: Offset(0.7, 0.7)),
                                  ]),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      focusColor: Colors.grey,
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        size: 25,
                                        color: Colors.grey,
                                      ),
                                      labelText: "Destination",
                                      labelStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 90,
                          ),
                          Container(
                            height: 40,
                            width: 500,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Rental()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                50))) // Background color
                                    ),
                                child: const Text(
                                  "Next",
                                  style: TextStyle(fontSize: 25),
                                )),
                          )
                        ],
                      ),
                    )))
          ],
        ));
  }
}
