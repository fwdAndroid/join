import 'package:flutter/material.dart';
import 'package:join/filters/filters.dart';
import 'package:join/notification/notiy.dart';

class WelComePage extends StatefulWidget {
  const WelComePage({super.key});

  @override
  State<WelComePage> createState() => _WelComePageState();
}

class _WelComePageState extends State<WelComePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 182),
        child: AppBar(
          backgroundColor: Color.fromARGB(19, 246, 246, 244),
          elevation: 6,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: Text(
            "Welcome to JOIN",
            style: TextStyle(
                fontFamily: "ProximaNova",
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Color(0xff160F29)),
            overflow: TextOverflow.ellipsis,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/yellow.png",
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Filters()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/right.png"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (builder) => Noti()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/noti.png"),
              ),
            ),
          ],
          flexibleSpace: Container(
            margin: EdgeInsets.only(top: 90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (builder) => PhysicalActivities()));
                  },
                  child: Column(
                    children: [
                      Image.asset("assets/pc1.png",
                          width: 50, height: 50, fit: BoxFit.cover),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Physical\nActivities",
                        style: TextStyle(
                            color: Color(0xff160F29).withOpacity(.8),
                            fontSize: 10,
                            fontFamily: "ProximaNova",
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image.asset("assets/pc3.png",
                        width: 50, height: 50, fit: BoxFit.cover),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      style: TextStyle(
                          color: Color(0xff160F29).withOpacity(.8),
                          fontSize: 10,
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w600),
                      "Interllectual\nActivities",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/pc5.png",
                        width: 50, height: 50, fit: BoxFit.cover),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      style: TextStyle(
                          color: Color(0xff160F29).withOpacity(.8),
                          fontSize: 10,
                          fontFamily: "ProximaNova",
                          fontWeight: FontWeight.w600),
                      "Sip\nTogether",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/pc2.png",
                        width: 50, height: 50, fit: BoxFit.cover),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w600,
                        color: Color(0xff160F29).withOpacity(.8),
                      ),
                      "Creative\nActivities",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset("assets/pc4.png",
                        width: 50, height: 50, fit: BoxFit.cover),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        fontFamily: "ProximaNova",
                        color: Color(0xff160F29).withOpacity(.8),
                      ),
                      "Relaxation and\nLeisure Activities",
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: 600,
        child: Stack(
          children: [
            Image.asset(
              "assets/map.png",
              fit: BoxFit.cover,
              height: 600,
            ),
            InkWell(
              onTap: _showMyDialog,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 80),
                  height: 34,
                  width: 94,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: Center(
                    child: Text(
                      "List View",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          width: 500,
          height: 267,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AlertDialog(
              insetPadding: EdgeInsets.all(5),
              contentPadding: EdgeInsets.all(5),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            child: Icon(
                              Icons.close,
                              color: Color(0xffFF1919),
                              size: 9,
                            ),
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFF1919).withOpacity(.20)),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/errors.png"),
                      ),
                      title: Text(
                        "Paddy O'Furniture",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Lorem Ipsum",
                        style: TextStyle(
                            color: Color(0xff736F7F),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              "House Party",
                              style: TextStyle(
                                  color: Color(0xff246A73), fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          width: 50,
                          height: 26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff368F8B).withOpacity(.10)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "House Party",
                              style: TextStyle(
                                  color: Color(0xff246A73), fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          width: 50,
                          height: 26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff368F8B).withOpacity(.10)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "House Party",
                              style: TextStyle(
                                  color: Color(0xff246A73), fontSize: 8),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          width: 50,
                          height: 26,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xff368F8B).withOpacity(.10)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(110, 40),
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                backgroundColor: Color(0xff246A73)),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (builder) =>
                              //             PhysicalActivities()));
                            },
                            child: Text(
                              "Invite",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: Size(110, 40),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Chat",
                              style: TextStyle(
                                  color: Color(0xff246A73),
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
