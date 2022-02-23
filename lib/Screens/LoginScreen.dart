// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havest/Screens/HomeScreen.dart';
import 'package:havest/api_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  apiLoginCall() {
    final service = LoginApiService();

    service.login(
      {
        "email": emailController.text,
        "password": passwordController.text,
      },
    ).then(
      (value) async {
        if (value.status == "success") {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString("userstatus", value.status);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          _scaffoldKey.currentState!
              .showSnackBar(SnackBar(content: Text(value.message)));
        }
      },
    );
  }

  @override
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Widget build(BuildContext context) {
    print(emailController.text);
    return Scaffold(
      backgroundColor: Color(0xFFE1E4E8),
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables

        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Image.asset(
            "assets/images/logo.png",
            width: 180,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xFF238A83), Color(0xFF0A918A)]),
          ),
        ),
      ),
      drawer: Drawer(),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 30, right: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Welcome back",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("hello Field Assistant Welcome back!",
                          style:
                              TextStyle(fontSize: 16, color: Colors.black54)),
                    ),
                    Text("Signin to manage the harvesting data",
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                  ],
                ),
              ),
              Container(
                // ignore: unnecessary_new
                decoration: new BoxDecoration(

                    // ignore: unnecessary_new
                    borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0),
                )),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter email';
                            } else if (!value.contains("@")) {
                              return "please enter valid email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 23),
                            hintText: "Email Address",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xFFbfc6cb),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'plese enter Password';
                            } else if (value.length < 2) {
                              return 'password must be at least 2 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 23),
                            hintText: "Password",
                            border: borderStyle(),
                            enabledBorder: borderStyle(),
                            focusedBorder: borderStyle(),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xFFbfc6cb),
                            ),
                          ),
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            height: 62, //height of button
                            width: double.infinity, //width of button
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // ignore: prefer_const_constructors
                                  primary: Color(
                                      0xFF0A918A), //background color of button
                                  //border width and color
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(6.0)),
                                  //content padding inside button
                                ),
                                onPressed: () {
                                  if (formGlobalKey.currentState!.validate()) {
                                    apiLoginCall();
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontSize: 17),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: BorderSide(
        color: Color(0xFFbfc6cb),
        style: BorderStyle.solid,
        width: 0.5,
      ),
    );
  }
}
