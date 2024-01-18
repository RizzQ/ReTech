import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:retech/SharedCode.dart';
import 'package:retech/screens/HomePage.dart';
import 'package:retech/screens/RegisterPage.dart';
import 'package:retech/screens/UbahSandiPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String errormsg;
  late bool error, showprogress;
  late TextEditingController txtFieldUsername;
  late String username, password;
  var _username = TextEditingController();
  var _password = TextEditingController();
  @override
  void initState() {
    username = "";
    password = "";
    errormsg = "";
    error = false;
    showprogress = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Dengan masuk, Anda menyetujui syarat dan ketentuan kami',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _username,
                  onChanged: (value) {
                    username = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _password,
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Sandi',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UbahSandiPage()),
                          );
                        },
                        child: Text(
                          'Lupa Sandi?',
                          style: TextStyle(
                            color: SharedCodes.primary
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: SharedCodes.primary),
                    onPressed: () {
                      if (username == "User" && password == "123") {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (_) => HomePage()));
                      }
                      // startLogin();
                    },
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Belum memiliki Akun?',
                      style:
                          TextStyle(color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Daftar Sekarang',
                          style: TextStyle(color: Color.fromARGB(255, 194, 75, 57)),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String stringTitle, String stringContent) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(stringTitle),
      content: Text(stringContent),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  startLogin() async {
    String apiurl = "${SharedCodes.apiUrl}/user/login.php";

    final response = await http.post(Uri.parse(apiurl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({"c_username": username, "c_password": password}));
    print(response);

    print(response.statusCode);
    print(response.body.toString());

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata["message"] != null) {
        setState(() {
          showprogress = false; //don't show progress indicator
          error = true;
          errormsg = jsondata["message"];
          showAlertDialog(context, "Alert!", errormsg);
        });
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', jsondata["user_name"]);
        prefs.setString('fullname', jsondata["full_name"]);
        prefs.setString('iduser', jsondata["id_user"]);
        prefs.setString('iduser', jsondata["id_user"]);
        prefs.setString('token', jsondata["token"]);
        setState(() {
          print(jsondata["token"]);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        });
      }
    } else {
      setState(() {
        showprogress = false; //don't show progress indicator
        error = true;
        errormsg = "Error during connecting to server.";
      });
    }
  }
}
