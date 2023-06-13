import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String radioButtonItem = 'Male';
  int id = 1;

  List<String> dropdownItemList = [
    "Item One",
    "Item Two",
    "Item Three",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: "ProximaNova",
              fontSize: 20,
              color: Color(0xff160F29),
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 420,
            child: Stack(
              children: [
                Image.asset(
                  "assets/Group 1000001549.png",
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Center(
                            child: Image.asset(
                              "assets/Group 1000001550.png",
                              width: 80,
                              height: 70,
                            ),
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff736F7F)),
                            )),
                        Container(
                          width: 315,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 10, left: 10),
                                hintText: "Fawad Kaleem",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color(0xffEBF1F3)),
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: Text(
                              "Choose your Date of Birth",
                              style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff736F7F)),
                            )),
                        Container(
                          width: 315,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/card.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.only(top: 10, left: 10),
                                hintText: "21/05/2023",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color(0xffEBF1F3)),
                          ),
                        ),
                        Container(
                            width: 315,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: id,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItem = 'ONE';
                                      id = 1;
                                    });
                                  },
                                ),
                                Text(
                                  'Male',
                                  style: new TextStyle(fontSize: 17.0),
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: id,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItem = 'TWO';
                                      id = 2;
                                    });
                                  },
                                ),
                                Text(
                                  'Female',
                                  style: new TextStyle(
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontFamily: "ProximaNova",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff736F7F)),
                            )),
                        Container(
                          width: 315,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 10, left: 10),
                                hintText: "Add Phone Number",
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: Color(0xffEBF1F3))),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color(0xffEBF1F3)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 15, top: 10),
            child: Text("Interest",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "ProximaNova",
                  fontSize: 20,
                  color: Color.fromARGB(255, 2, 0, 7),
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 15, top: 10),
            child: Text("Choose up to 5 interests per category",
                style: TextStyle(
                  fontFamily: "ProximaNova",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff736F7F),
                )),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/s.png",
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Workout and Athletics",
                          style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          "2/5",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff736F7F)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xffECF2F3),
                    thickness: 2,
                  ),
                  Center(
                    child: GroupButton(
                      isRadio: false,
                      buttons: [
                        "Football",
                        "Golf",
                        "Yoga",
                        "Cricket",
                        "Football",
                        "Hockey"
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/flower.png",
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Activities for intellectual",
                          style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          "2/5",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff736F7F)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xffECF2F3),
                    thickness: 2,
                  ),
                  Center(
                    child: GroupButton(
                      isRadio: false,
                      buttons: [
                        "Networking",
                        "Study Groups",
                        "Languages",
                        "Cricket",
                        "Football",
                        "Hockey"
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/soc.png",
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Social & hangout",
                          style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          "2/5",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff736F7F)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xffECF2F3),
                    thickness: 2,
                  ),
                  Center(
                    child: GroupButton(
                      isRadio: false,
                      buttons: [
                        "Networking",
                        "Study Groups",
                        "Languages",
                        "Cricket",
                        "Football",
                        "Hockey"
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/as.png",
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Culture and adventure",
                          style: TextStyle(
                              fontFamily: "ProximaNova",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          "2/5",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff736F7F)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xffECF2F3),
                    thickness: 2,
                  ),
                  Center(
                    child: GroupButton(
                      isRadio: false,
                      buttons: [
                        "Museum",
                        "Exbition",
                        "Languages",
                        "Cricket",
                        "Football",
                        "Hockey"
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(12), child: Image.asset("assets/save.png"))
        ]),
      ),
    );
  }
}
