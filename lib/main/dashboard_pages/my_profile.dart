import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "My Profile",
            style: TextStyle(
                fontFamily: "ProximaNova",
                fontSize: 20,
                color: Color(0xff160F29),
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (builder) => AppSetting()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/set.png"),
              ),
            )
          ],
        ),
        body: SizedBox(
            child: SingleChildScrollView(
                child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                // decoration: AppDecoration.fillBluegray70014,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 216,
                      width: double.maxFinite,
                      margin: EdgeInsets.only(
                        bottom: 1206,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(
                            1,
                            0.83,
                          ),
                          end: Alignment(
                            0.16,
                            0.2,
                          ),
                          colors: [
                            Color(0xff368f8b),
                            Color(0xffff6e78),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                  left: 16,
                  top: 20,
                  right: 16,
                ),
                padding: EdgeInsets.only(
                  left: 52,
                  top: 22,
                  right: 52,
                  bottom: 22,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 61,
                              width: 61,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // gradient: LinearGradient(
                                //   begin: Alignment(
                                //     1,
                                //     0.83,
                                //   ),
                                //   end: Alignment(
                                //     0.16,
                                //     0.2,
                                //   ),
                                //   colors: [
                                //     ColorConstant.redA100,
                                //     ColorConstant.red300,
                                //   ],
                                // ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/scan.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 19,
                      ),
                      child: Text(
                        "Fawad Kaleem",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xff160F29),
                            fontWeight: FontWeight.w600,
                            fontFamily: "ProximaNova",
                            fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                backgroundColor: Color(0xff246A73),
                                fixedSize: Size(115, 48)),
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/scan.png",
                              height: 20,
                            ),
                            label: Text(
                              "QR CODE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 10),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                backgroundColor: Color(0xffFF7E87),
                                fixedSize: Size(100, 48)),
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/sss.png",
                              height: 20,
                            ),
                            label: Text(
                              "Scan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "ProximaNova",
                                  fontSize: 10),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 104,
              margin: EdgeInsets.only(top: 290, left: 10, right: 10),
              child: Card(
                child: ListTile(
                  leading: Image.asset("assets/errors.png"),
                  title: Text(
                    "No Connection Yet!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                  subtitle: Text(
                    "Meet other users and scan their QR Codes to connect.",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: "ProximaNova",
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 104,
              margin: EdgeInsets.only(top: 400, left: 10, right: 10),
              child: Card(
                child: ListTile(
                  leading: Image.asset("assets/phone.png"),
                  title: Text(
                    "No invite yet!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "Invite your friend and experience the events in your area together.",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ))));
  }
}
