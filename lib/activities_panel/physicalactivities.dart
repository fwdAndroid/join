import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:join/activities_details/detail.page.dart';

class PhysicalActivities extends StatefulWidget {
  const PhysicalActivities({super.key});

  @override
  State<PhysicalActivities> createState() => _PhysicalActivitiesState();
}

class _PhysicalActivitiesState extends State<PhysicalActivities> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('activity')
      .where("activity", isEqualTo: "Physical Activities")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 243, 246),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(19, 246, 246, 244),
        title: Text(
          "Physical Activities",
          style: TextStyle(
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: Color(0xff160F29)),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
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
                  child: ListTile(
                    leading: Image.network(
                      data['photo'].toString(),
                      fit: BoxFit.cover,
                      width: 55,
                      height: 55,
                    ),
                    title: Text(
                      data['title'],
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff160F29),
                          fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['description'],
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xff160F29).withOpacity(.6),
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
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
                        Divider(),
                        Row(
                          children: [
                            Image.asset(
                              "assets/g.png",
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              data['location'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff160F29).withOpacity(.6),
                                  fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => DetailPage(
                                              date: data['date'],
                                              image: data['photo'],
                                              title: data['title'],
                                              desc: data['description'],
                                              endTime: data['endTime'],
                                              uuid: data['uuid'],
                                              location: data['location'],
                                              startTime: data['startTime'],
                                            )));
                              },
                              child: Text(
                                "View Details",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  backgroundColor: Color(0xff246A73),
                                  fixedSize: Size(100, 30)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
