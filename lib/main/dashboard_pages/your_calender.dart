import 'package:flutter/material.dart';

import 'package:material_segmented_control/material_segmented_control.dart';

class YourCalender extends StatefulWidget {
  const YourCalender({super.key});

  @override
  State<YourCalender> createState() => _YourCalenderState();
}

class _YourCalenderState extends State<YourCalender> {
  int _currentSelection = 0;
  Map<int, Widget> _children = {
    0: Text('All'),
    1: Text('Going'),
    2: Text('Past'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 243, 246),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Your Calendar",
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
        centerTitle: true,
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
            height: MediaQuery.of(context).size.height / 1.6,
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                alignment: Alignment.center,
                                width: 300,
                                height: 111,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/back.png",
                                      width: 300,
                                    ),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12, top: 5),
                              child: Text(
                                "Sunday Funday Drinks abd Many More",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "ProximaNova",
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12, top: 5),
                              child: Text(
                                "Explore BKK Social Club",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xff736F7F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ProximaNova",
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 12, top: 5, bottom: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/Vector.png",
                                    width: 13,
                                    height: 13,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "July 12,2023 | 10:30 AM - 4:50 PM",
                                    style: TextStyle(
                                      color: Color(0xff160F29).withOpacity(.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ProximaNova",
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 50,
                                    height: 18,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color:
                                            Color(0xff246A73).withOpacity(.10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "Going",
                                        style: TextStyle(
                                            color: Color(0xff246A73),
                                            fontSize: 10,
                                            fontFamily: "ProximaNova",
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
