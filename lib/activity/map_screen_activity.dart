import 'package:flutter/material.dart';
import 'package:join/main/main_screen.dart';
import 'package:uuid/uuid.dart';

class MapScreenActivity extends StatefulWidget {
  final starttime;
  final endtime;
  final title;
  final desc;
  final cate;
  final day;
  final search;
  final image;
  const MapScreenActivity(
      {super.key,
      required this.cate,
      required this.day,
      required this.search,
      required this.title,
      required this.desc,
      required this.endtime,
      required this.starttime,
      required this.image});

  @override
  State<MapScreenActivity> createState() => _MapScreenActivityState();
}

class _MapScreenActivityState extends State<MapScreenActivity> {
  TextEditingController _locationController = TextEditingController();
  var uuid = Uuid().v4();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 243, 246),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 6,
        title: Text(
          "Set Location",
          style: TextStyle(
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: Color(0xff160F29)),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Container(
        height: 800,
        child: Stack(
          children: [
            Image.asset(
              "assets/map.png",
              fit: BoxFit.cover,
              height: 800,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 60, left: 20, right: 20),
                height: 174,
                width: 343,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.1), //(x,y)
                        blurRadius: 0.5,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        "Location",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xff736F7F),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Color(0xffE5E5EA),
                            )),
                        margin: EdgeInsets.only(left: 15, top: 10, right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide:
                                      BorderSide(color: Color(0xffE5E5EA))),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xffE5E5EA),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffE5E5EA),
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              prefixIcon: Icon(
                                Icons.pin_drop_rounded,
                                color: Colors.black,
                              ),
                              border: InputBorder.none,
                              hintText: "52 Rue Des Fleurs 33500 Libourne"),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MainScreen()));
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 15, top: 10, right: 10, bottom: 10),
                          child: Image.asset("assets/save.png")),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void createProfile() async {
  //   if (widget.desc.isEmpty || widget.title.isEmpty) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("All Fields are required")));
  //   } else {
  //     String photoURL = await StorageMethods()
  //         .uploadImageToStorage('UserPics', widget.image!, true);

  //     FirebaseFirestore.instance.collection("activity").doc(uuid).set({
  //       "title": widget.title,
  //       "description": widget.desc,
  //       "location": widget.search,
  //       "address": _locationController.text,
  //       "category": widget.cate,
  //       "photo": photoURL,
  //       "date": widget.day,
  //       "uid": FirebaseAuth.instance.currentUser!.uid,
  //       "startTime": widget.starttime,
  //       "endTime": widget.endtime,
  //     }).then((value) {
  //       showSnakBar("Completed", context);
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (builder) => MainScreen()));
  //     });
  //   }
  // }
}
