import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import 'package:intl/intl.dart';
import 'package:join/activity/map_screen_activity.dart';

class NextActivityPage extends StatefulWidget {
  final title;
  final description;
  final image;
  final cate;

  const NextActivityPage(
      {super.key,
      required this.description,
      required this.image,
      required this.cate,
      required this.title});

  @override
  State<NextActivityPage> createState() => _NextActivityPageState();
}

class _NextActivityPageState extends State<NextActivityPage> {
  TextEditingController searchController = TextEditingController();
  TextEditingController createDateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  DateTime? _selectedDate;
  String googleApikey = "AIzaSyBffT8plN_Vdcd308KgmzIfGVQN6q-CkAo";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  bool _isLoading = false;
  List latlong = [];
  String location = 'Please move map to A specific location.';
  @override
  void initState() {
    getLatLong();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LatLng startLocation = _isLoading
        ? const LatLng(25.276987, 55.296249)
        : LatLng(latlong[0], latlong[1]);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 243, 246),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create Activity",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: Color(0xff160F29)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 15,
              top: 12,
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/bxs_category-alt.png",
                  height: 18,
                  width: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    bottom: 1,
                  ),
                  child: Text(
                    "Add Location",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff736F7F)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: 277,
                    height: 46,
                    child: TextFormField(
                      onTap: () async {
                        var place = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: googleApikey,
                            mode: Mode.overlay,
                            types: [],
                            strictbounds: false,
                            components: [Component(Component.country, 'ae')],
                            //google_map_webservice package
                            onError: (err) {
                              print(err);
                            });

                        if (place != null) {
                          setState(() {
                            location = place.description.toString();
                            searchController.text = location;
                          });
                          final plist = GoogleMapsPlaces(
                            apiKey: googleApikey,
                            apiHeaders: await GoogleApiHeaders().getHeaders(),
                            //from google_api_headers package
                          );
                          String placeid = place.placeId ?? "0";
                          final detail =
                              await plist.getDetailsByPlaceId(placeid);
                          final geometry = detail.result.geometry!;
                          final lat = geometry.location.lat;
                          final lang = geometry.location.lng;
                          var newlatlang = LatLng(lat, lang);
                          mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: newlatlang, zoom: 17)));
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.only(top: 10),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Search Location",
                        helperStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey,
                        ),
                      ),
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: searchController,
                    ),
                  ),
                ),
                Expanded(
                    child: Image.asset(
                  "assets/Group 1000001315.png",
                  width: 52,
                  height: 46,
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, bottom: 1, top: 12),
            child: Row(children: [
              Image.asset(
                "assets/select.png",
                height: 18,
                width: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Select Date",
                style: TextStyle(
                    fontFamily: "ProximaNova",
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff736F7F)),
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: TextFormField(
              onTap: () {
                _selectDate(context);
              },
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/Chevon Left.png",
                    height: 6,
                    width: 6,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.white)),
                hintText: "12/04/2023",
                helperStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
              autofocus: true,
              controller: createDateController,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Row(children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 1, top: 12),
                    child: Row(children: [
                      Image.asset(
                        "assets/clock.png",
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Start Time",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff736F7F)),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 161,
                    height: 46,
                    child: TextField(
                      onTap: () {
                        _startTime(context);
                      },
                      controller: startTimeController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20, left: 10),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/Chevon Left.png",
                            height: 6,
                            width: 6,
                          ),
                        ),
                        hintText: "10 : 00 AM",
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12, bottom: 1, top: 12),
                    child: Row(children: [
                      Image.asset(
                        "assets/clock.png",
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "End Time",
                        style: TextStyle(
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff736F7F)),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 161,
                    height: 46,
                    child: TextField(
                      onTap: () {
                        _endTime(context);
                      },
                      controller: endTimeController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20, left: 10),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/Chevon Left.png",
                            height: 6,
                            width: 6,
                          ),
                        ),
                        hintText: "10 : 00 AM",
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              )),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    fixedSize: Size(343, 48),
                    backgroundColor: Color(0xff246A73)),
                onPressed: createProfile,
                child: Text(
                  "Ready To Share",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }

  _startTime(BuildContext context) async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      //timeController.text = time.format(context) from here
    ); //end of showTimePicker
    startTimeController.text = time!.format(context); // to here
  }

  _endTime(BuildContext context) async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      //timeController.text = time.format(context) from here
    ); //end of showTimePicker
    endTimeController.text = time!.format(context); // to here
  }

  _selectDate(BuildContext context) async {
    var newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      createDateController
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: createDateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  void createProfile() async {
    if (searchController.text.isEmpty ||
        endTimeController.text.isEmpty ||
        endTimeController.text.isEmpty ||
        createDateController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('All Fields are required')));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => MapScreenActivity(
                    cate: widget.cate,
                    title: widget.title,
                    desc: widget.description,
                    image: widget.image,
                    starttime: startTimeController.text,
                    endtime: endTimeController.text,
                    day: createDateController.text,
                    search: searchController.text,
                  )));
    }
  }

  void getLatLong() {}
}
