import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CabSelect extends StatefulWidget {
  static const String idscreen = "CarSelect";

  const CabSelect({super.key});

  @override
  State<CabSelect> createState() => _CabSelectState();
}

class _CabSelectState extends State<CabSelect> {
  bool _isSelectedFM = false;
  bool _isSelectedFO = false;
  String _time = "";
  String _date = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "CABTO",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: "AlumniSans",
              fontSize: 35,
              color: Colors.black),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 210,
                color: Colors.black,
                child: Image.asset('assets/Images/test.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.green,
                    size: 25,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: "Source Location",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.red,
                    size: 25,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  labelText: "Destination Location",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "Top Suggestions for you",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Pick up Date and Time",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // const SizedBox(height: 2,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  DateTime? DatePicker = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2024),
                                  );
                                  if (DatePicker != null) {
                                    setState(() {
                                      _date = (DateFormat('yMMMd')
                                          .format(DatePicker));
                                    });
                                  }
                                },
                                icon: const Icon(Icons.calendar_month_outlined)),
                            Text(
                              _date,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            IconButton(
                                onPressed: () async {
                                  TimeOfDay? timepicked = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      initialEntryMode:
                                          TimePickerEntryMode.input);
                                  if (timepicked != null) {
                                    setState(() {
                                      _time = timepicked.format(context);
                                    });
                                  }
                                },
                                icon: const Icon(
                                    Icons.access_time_filled_outlined)),
                            Text(
                              _time,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                blurStyle: BlurStyle.outer)
                          ]),
                      height: 80,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            child: Image.asset('assets/Images/sedan.jpg'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sedan",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Maruti Swift Dzire or Similar",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "₹3729",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.info_outline,
                                size: 25,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                blurStyle: BlurStyle.outer)
                          ]),
                      height: 80,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            child: Image.asset('assets/Images/suv.jpg'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "SUV",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Toyota innova 6+1 or Similar",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "₹5832",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.info_outline,
                                size: 25,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5.0,
                                blurStyle: BlurStyle.outer)
                          ]),
                      height: 80,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 90,
                            child: Image.asset('assets/Images/cysta1.jpeg'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Crysta",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Toyota innova Crysta 6+1 or Similar",
                                style:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "₹8086",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Icon(
                                Icons.info_outline,
                                size: 25,
                                color: Colors.grey,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  FilterChip(
                    label: const Text("Book for Myself"),
                    selected: _isSelectedFM,
                    onSelected: (bool value) {
                      setState(() {
                        _isSelectedFM = !_isSelectedFM;
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
                    label: const Text("Book for others"),
                    selected: _isSelectedFO,
                    onSelected: (bool value) {
                      setState(() {
                        _isSelectedFO = !_isSelectedFO;
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
                height: 30,
              ),
              Container(
                height: 40,
                width: 500,
                child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Thank You, for Booking..")));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(50))) // Background color
                        ),
                    child: const Text(
                      "Book",
                      style: TextStyle(fontSize: 25),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
