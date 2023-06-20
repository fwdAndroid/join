import 'package:flutter/material.dart';
import 'package:join/calenderpages/all.dart';
import 'package:join/calenderpages/ongoing.dart';
import 'package:join/calenderpages/past.dart';
import 'package:join/messages_screen/event_chat.dart';
import 'package:join/messages_screen/people_chat.dart';

/// Flutter code sample for [TabBar].

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/info.png"),
            )
          ],
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Messages",
            style: TextStyle(
                fontFamily: "ProximaNova",
                fontSize: 20,
                color: Color(0xff160F29),
                fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: "Events",
              ),
              Tab(
                text: "People",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            EventsChat(),
            PeopleChat(),
          ],
        ),
      ),
    );
  }
}
