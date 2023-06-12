import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController searchController = TextEditingController();
  int _currentSelection = 0;
  Map<int, Widget> _children = {
    0: Text('Events'),
    1: Text('People'),
  };
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            width: MediaQuery.of(context).size.width,
            child: MaterialSegmentedControl(
              verticalOffset: 12,
              horizontalPadding: EdgeInsets.all(20),
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.grey,
              selectedColor: Color(0xff246A73),
              unselectedColor: Colors.white,
              selectedTextStyle: TextStyle(color: Colors.white),
              unselectedTextStyle: TextStyle(color: Colors.black),
              borderWidth: 0.7,
              borderRadius: 2,
              onSegmentTapped: (index) {
                setState(() {
                  _currentSelection = index;
                });
              },
            ),
          ),
          Container(
            height: 46,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0), //(x,y)
                    blurRadius: 0.2,
                  ),
                ]),
            margin: EdgeInsets.only(left: 25, top: 8, right: 25),
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Color(0xff736F7F).withOpacity(.3),
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff160F29),
                  )),
              focusNode: FocusNode(),
              autofocus: true,
              controller: searchController,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/chat.png",
                    height: 50,
                    width: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 6),
                    child: Text(
                      "No Chat Yet!",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(
                          0xff160F29,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: "ProximaNova",
                      ),
                    ),
                  ),
                  Container(
                    width: 292,
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    child: Text(
                      "No chats were found. Please change the search parameter, or start a new chat over the map.",
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(
                          0xff736F7F,
                        ),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ProximaNova",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
