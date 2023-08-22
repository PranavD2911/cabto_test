import 'package:cabto_test/Screens/CarSelect.dart';
import 'package:cabto_test/bloc/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OutStation extends StatefulWidget {
  static const String idscreen = "OutStation";

  const OutStation({super.key});

  @override
  State<OutStation> createState() => _OutStationState();
}

class _OutStationState extends State<OutStation> {
  final MapController _mapController = MapController();
  bool _isSelectedRT = false;
  bool _isSelectedOW = false;

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
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    focusColor: Colors.grey,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    labelText: "Destination",
                                    labelStyle: TextStyle(color: Colors.black)),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  FilterChip(
                                    label: const Text("One-way"),
                                    selected: _isSelectedOW,
                                    onSelected: (bool value) {
                                      setState(() {
                                        _isSelectedOW = !_isSelectedOW;
                                      });
                                    },
                                    backgroundColor: Colors.white54,
                                    shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(color: Colors.black)),
                                    selectedColor: Colors.grey,
                                    // checkmarkColor: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  FilterChip(
                                    label: const Text("Round Trip"),
                                    selected: _isSelectedRT,
                                    onSelected: (bool value) {
                                      setState(() {
                                        _isSelectedRT = !_isSelectedRT;
                                      });
                                    },
                                    backgroundColor: Colors.white54,
                                    shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(color: Colors.black)),
                                    selectedColor: Colors.grey,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const TextField(
                                keyboardType: TextInputType.datetime,
                                textCapitalization: TextCapitalization.none,
                                decoration: InputDecoration(
                                    filled: true,
                                    focusColor: Colors.grey,
                                    prefixIcon: Icon(
                                      Icons.calendar_month_outlined,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    labelText: "Return Date",
                                    labelStyle: TextStyle(color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        width: 500,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CabSelect()));
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
                ),
              ),
            )
          ],
        ));
  }
}
