import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:join/main/main_screen.dart';
import 'package:uuid/uuid.dart';

class CalendersDetails extends StatefulWidget {
  final createrId;
  final date;
  final desc;
  final endTime;
  final image;
  final joinid;
  final joinname;
  final startTime;
  final title;
  const CalendersDetails(
      {super.key,
      required this.createrId,
      required this.date,
      required this.desc,
      required this.endTime,
      required this.image,
      required this.joinid,
      required this.joinname,
      required this.startTime,
      required this.title});

  @override
  State<CalendersDetails> createState() => _CalendersDetailsState();
}

class _CalendersDetailsState extends State<CalendersDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 225, 243, 246),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(19, 246, 246, 244),
          title: Text(
            widget.title,
            style: TextStyle(
                fontFamily: "ProximaNova",
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Color(0xff160F29)),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    widget.image.toString(),
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 1,
                              color: Colors.grey)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Title",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            widget.desc,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/timer.png",
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.date,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.startTime,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("to"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.endTime,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            fixedSize: Size(343, 50),
                            backgroundColor: Color(0xff246A73)),
                        onPressed: () async {
                          var uuid = Uuid().v1();
                          await FirebaseFirestore.instance
                              .collection("chats")
                              .doc(uuid)
                              .set({
                            "joinid": widget.joinid,
                            "joinname": widget.joinname,
                            "eventname": widget.title,
                            "eventid": widget.createrId,
                            "eventimage": widget.image,
                            "uuid": uuid,
                          }).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Chat Initiated")));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => MainScreen()));
                          });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (builder) => CalendersDetails(
                          //               createrId: data['creatorid'],
                          //               date: data['date'],
                          //               desc: data['desc'],
                          //               endTime: data['endTime'],
                          //               image: data['image'],
                          //               joinid: data['joinid'],
                          //               joinname: data['joinname'],
                          //               startTime: data['startTime'],
                          //               title: data['title'],
                          //             )));
                        },
                        child: Text(
                          "Chat Now",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
