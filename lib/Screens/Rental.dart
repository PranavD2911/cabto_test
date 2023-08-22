import 'package:cabto_test/Screens/Outstation.dart';
import 'package:cabto_test/bloc/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Rental extends StatefulWidget {
  static const String idscreen = "Rental";

  const Rental({super.key});

  @override
  State<Rental> createState() => _RentalState();
}

class _RentalState extends State<Rental> {
  final MapController _mapController = MapController();

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
              left: 0,
              bottom: 0,
              child: Container(
                height: 300,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Select Package",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 105,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.grey, // Background color
                                ),
                                child: const Text("8Hr   80 KM",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black))),
                          ),
                          SizedBox(
                            height: 70,
                            width: 105,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.grey, // Background color
                                ),
                                child: const Text("15Hr   80 KM",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black))),
                          ),
                          SizedBox(
                            height: 70,
                            width: 105,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.grey, // Background color
                                ),
                                child: const Text("9Hr   80 KM",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black))),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
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
                              labelText: "Destination",
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(
                        height: 42,
                      ),
                      Container(
                        height: 40,
                        width: 500,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OutStation()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: const RoundedRectangleBorder(
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
                ),
              ),
            ),
          ],
        ));
  }
}
