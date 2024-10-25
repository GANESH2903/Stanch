import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stanch/screens/HomePage.dart';
import 'package:stanch/screens/initScreen.dart';

import '../const.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  String? _inputEmail;
  String? _inputPassword;

  String? _validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email or phone number';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

    final phoneRegex = RegExp(r'^[6789][0-9]{9}$');

    if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
      return 'Please enter a valid email or phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  void postLogin() {
    if((_inputEmail == GlobalVar().userEmail_1 || _inputEmail == GlobalVar().userEmail_2 ) && (_inputPassword == GlobalVar().password)){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Initscreen()));
    }
    else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: 'Invalid Credentials!',
      );
    }
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(builder: (context) => Homepage()),
    //   (Route<dynamic> route) => false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "promilo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Text(
                  "Hi, Welcome Back!",
                  style: TextStyle(
                      color: Color.fromARGB(207, 8, 68, 26),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Please Sign in to continue",
                        style: TextStyle(
                            color: Color.fromARGB(207, 8, 68, 26),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email or Mob No.',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: _validateEmailOrPhone,
                  onSaved: (value) {
                    _inputEmail = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sign In With OTP",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            color: Color.fromARGB(207, 8, 68, 26),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                    ),
                  ),
                  validator: _validatePassword,
                  onSaved: (value) {
                    _inputPassword = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Text(
                      "Forget Password",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      postLogin();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      color: Color.fromARGB(103, 70, 108, 124),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("or"),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 35,
                        width: 35,
                        child: Image.asset("assets/Logo-google-icon-PNG.png")),
                    Container(
                        height: 35,
                        width: 35,
                        child: Image.asset("assets/linkedin.png")),
                    Container(
                        height: 35,
                        width: 35,
                        child:
                            Image.asset("assets/Facebook_logo_(square).png")),
                    Container(
                        height: 35,
                        width: 35,
                        child: Image.asset("assets/Instagram_icon.png")),
                    Container(
                        height: 35,
                        width: 35,
                        child: Image.asset("assets/whatapplogo.jpeg")),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Business User?",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    Text(
                      "Don't have an account",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Login Here",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing, you agree to Promilo's ",
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Terms of Use & Privacy Policy',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
