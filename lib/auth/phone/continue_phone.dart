import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:join/auth/phone/verify_phone.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ContinuePhone extends StatefulWidget {
  const ContinuePhone({Key? key}) : super(key: key);

  @override
  State<ContinuePhone> createState() => _ContinuePhoneState();
}

class _ContinuePhoneState extends State<ContinuePhone> {
  final formKey = GlobalKey<FormState>();

  String dialCodeDigits = "+66";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    PhoneController controller;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash.png",
                width: 150,
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "OTP Verification",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "We will send you a code for verification dont share \n anyone your code",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70),
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  children: [
                    CountryCodePicker(
                        onChanged: (country) {
                          setState(() {
                            dialCodeDigits = country.dialCode!;
                          });
                        },
                        initialSelection: "TH",
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        favorite: ["+66", "TH"]),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "Required"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "12345678",
                            //  prefix: Padding(padding: EdgeInsets.all(10),child: Text(dialCodeDigits,style: TextStyle(color: Colors.black),),),
                          ),
                          keyboardType: TextInputType.number,
                          controller: _controller,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => VerifyPhone(
                                    phone: _controller.text,
                                    codeDigits: dialCodeDigits)));
                      }
                    },
                    child: Text(
                      'Get OTP',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Color(0xff246A73),
                        fixedSize: Size(300, 46))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
