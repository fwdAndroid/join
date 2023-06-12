import 'package:flutter/material.dart';
import 'package:join/main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/backs.png",
            ),
            fit: BoxFit.cover,
          )),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, left: 10),
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Log In",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff246A73),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: "ProximaNova")),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, left: 15),
                  child: Text(
                    "Please select below option to continue.",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff736F7F),
                        fontSize: 16,
                        fontFamily: "ProximaNova",
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => MainScreen()));
                  },
                  child: Center(
                    child: Container(
                      height: 53,
                      width: 343,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: Color(0xff8377C6).withOpacity(.11))
                        ],
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Colors.white, Colors.white],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/googl.png",
                              height: 23,
                              width: 23,
                            ),
                          ),
                          Text(
                            "Log In with Google",
                            style: TextStyle(
                                color: Color(0xff160F29),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: "ProximaNova"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Center(
                    child: Container(
                      height: 53,
                      width: 343,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: Color(0xff8377C6).withOpacity(.11))
                        ],
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Colors.white, Colors.white],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/l.png",
                              height: 23,
                              width: 23,
                            ),
                          ),
                          Text(
                            "Log In with Facebook",
                            style: TextStyle(
                                color: Color(0xff160F29),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: "ProximaNova"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Center(
                    child: Container(
                      height: 53,
                      width: 343,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: Color(0xff8377C6).withOpacity(.11))
                        ],
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Colors.white, Colors.white],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/imgGgphone.png",
                              height: 23,
                              width: 23,
                            ),
                          ),
                          Text(
                            "Log In with Phone Number",
                            style: TextStyle(
                                color: Color(0xff160F29),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                fontFamily: "ProximaNova"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff246A73).withOpacity(.10),
                  ),
                  margin: EdgeInsets.only(left: 10, top: 24, right: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "By registering or creating an account, you agree to our Terms of Use. Read our Privacy Policy to learn more about how we process your data.",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff246A73),
                          fontWeight: FontWeight.w400,
                          fontFamily: "ProximaNova"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ])),
    );
  }
}
