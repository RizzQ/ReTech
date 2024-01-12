import 'dart:io';

import 'package:flutter/material.dart';
import 'package:retech/SharedCode.dart';
import 'package:retech/models/UserModel.dart';
import 'package:retech/screens/HomePage.dart';
import 'package:retech/screens/LoginPage.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String errormsg;
  late bool error, showprogress;
  late TextEditingController txtFieldUsername;
  String? username, email, fullname, idUser;
  var _username = TextEditingController();
  var _fullname = TextEditingController();
  var _email = TextEditingController();
  double boxHeight1 = 10;
  double boxHeight2 = 30;
  File? uploadimage;

  @override
  void initState() {
    // TODO: implement initState
    fullname = "";
    errormsg = "";
    getUser();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ubah Profile'),
          elevation: 0,
          backgroundColor: SharedCodes.primary,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        30,
                      ),
                      topLeft: Radius.circular(
                        30,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      // uploadimage == null
                      //     ? Container()
                      //     : //if uploadimage is null then show empty container
                      //     Container(
                      //         //elese show image here
                      //         child: SizedBox(
                      //             height: 150,
                      //             child: Image.file(
                      //                 uploadimage!) //load image from file
                      //             )),
                      Icon(Icons.person, size: 100),
                      Text('Ubah Foto Profile'),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: boxHeight1,
                      ),
                      TextField(
                        controller: _username,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: boxHeight2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Lengkap',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: boxHeight1,
                      ),
                      TextField(
                        onChanged: (value) {
                          fullname = value;
                        },
                        controller: _fullname,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: boxHeight2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: boxHeight1,
                      ),
                      TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        controller: _email,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: boxHeight2,
                      ),
                      Container(
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: SharedCodes.primary),
                            onPressed: () {
                              saveUser();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => HomePage()),
                              // );
                            },
                            child: Text(
                              'Simpan',
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  

  saveUser() async {
    String apiurl = "${SharedCodes.apiUrl}/user/saveuser.php"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP
    print(fullname);
    print(email);

    final response = await http.post(Uri.parse(apiurl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "c_username": _username.text,
          "c_fullname": _fullname.text,
          "c_iduser": idUser,
          "c_email": _email.text
        }));

    print(response.statusCode);
    print(response.body.toString());

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata["error"] == "true") {
        setState(() {
          showprogress = false; //don't show progress indicator
          error = true;
          errormsg = jsondata["message"];
        });
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('fullname', _fullname.text);
        setState(() {
          error = false;
          showprogress = false;
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

  getUser() async {
    String apiurl = "${SharedCodes.apiUrl}/user/getuser.php"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    username = prefs.getString('username');
    print("get string value: " + username.toString());

    final response = await http.post(Uri.parse(apiurl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "c_username": username.toString(), //get the username text
        }));


    print(response.statusCode);
    print(response.body.toString());

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      setState(() {
        _username.text = jsondata["username"];
      _fullname.text = jsondata["fullname"];
      idUser = jsondata["iduser"];
      _email.text = jsondata["email"];
      });
  }

}}

class MyCardItem extends StatelessWidget {
  String title;
  String iconData;

  MyCardItem(this.title, this.iconData);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: double.infinity),
      width: 150,
      height: 175,
      child: Card(
        color: Colors.white,
        elevation: 3,
        margin: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconData),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }
}

class settingList extends StatelessWidget {
  String title;
  late var iconDesc;

  settingList(this.title, this.iconDesc);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: double.infinity),
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Text(title),
          ],
        ));
  }
}
