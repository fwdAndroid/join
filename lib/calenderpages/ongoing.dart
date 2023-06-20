import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:join/activities_details/calenders_details.dart';

class OnGoing extends StatefulWidget {
  OnGoing({
    super.key,
  });

  @override
  State<OnGoing> createState() => _OnGoingState();
}

class _OnGoingState extends State<OnGoing> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('calenders')
      .where("status", isEqualTo: "ongoing")
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 0.5)
                  ]),
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                data['image'],
                                height: 100,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  "assets/whiteshare.png",
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          data['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xff160F29),
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          data['desc'],
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff160F29).withOpacity(.6),
                              fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/timer.png",
                              width: 14,
                              height: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              data['date'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff160F29).withOpacity(.6),
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              data['startTime'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff160F29).withOpacity(.6),
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "to",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff160F29).withOpacity(.6),
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              data['endTime'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff160F29).withOpacity(.6),
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }).toList(),
        );
      },
    );
  }
}
// }
// Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (builder) => CalendersDetails(
//                                             createrId: data['creatorid'],
//                                             date: data['date'],
//                                             desc: data['desc'],
//                                             endTime: data['endTime'],
//                                             image: data['image'],
//                                             joinid: data['joinid'],
//                                             joinname: data['joinname'],
//                                             startTime: data['startTime'],
//                                             title: data['title'],
//                                           )));