import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:join/app_setting/app_setting.dart';
import 'package:join/database/storage_methods.dart';
import 'package:join/main/main_screen.dart';
import 'package:join/widgets/utils.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Uint8List? _image;

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AppSetting()));
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
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return new CircularProgressIndicator();
                          }
                          var document = snapshot.data;
                          return Container(
                            height: 80,
                            width: 80,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                InkWell(
                                  onTap: selectImage,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 61,
                                      width: 61,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: CircleAvatar(
                                        radius: 80,
                                        backgroundImage: NetworkImage(
                                            document['photo'].toString()),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    TextButton(
                        onPressed: dialog,
                        child: Text(
                          "Update Image",
                          style: TextStyle(color: Color(0xff246A73)),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 19,
                      ),
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return new CircularProgressIndicator();
                            }
                            var document = snapshot.data;
                            return Text(
                              document['name'],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff160F29),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "ProximaNova",
                                  fontSize: 18),
                            );
                          }),
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
                          width: 7,
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

  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  void dialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Image'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to update your profile image'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                String photoURL = await StorageMethods()
                    .uploadImageToStorage('ProfilePics', _image!, false);
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({"photo": photoURL});
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Image Updated Succesfully")));
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => MainScreen()));
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
