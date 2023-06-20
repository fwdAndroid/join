import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:join/chat_room/current_chat.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('chats').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/info.png"),
          )
        ],
        title: Text(
          "Messages",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(
              0xff160F29,
            ),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "ProximaNova",
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("chats")
                      .where("joinid",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(includeMetadataChanges: true),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('No Data Found'),
                      );
                    }

                    if (snapshot.hasData) {
                      print(FirebaseAuth.instance.currentUser!.uid);

                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, int index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return Column(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            documentSnapshot['eventimage']),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              documentSnapshot['eventname']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Color(0xff858585),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                          Text(
                                            documentSnapshot['joinname']
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      trailing: TextButton(
                                        child: Text(
                                          "Chat Now",
                                          style: TextStyle(
                                              color: Color(0xff246A73)),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CurrentChatRoom(
                                                doctorName: documentSnapshot[
                                                    'joinname'],
                                                receiverId:
                                                    documentSnapshot['eventid'],
                                                doctorId:
                                                    documentSnapshot['joinid'],
                                                receiverName: documentSnapshot[
                                                    'eventname'],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )),
                                Divider()
                              ],
                            );
                          });
                    } else {
                      return Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
