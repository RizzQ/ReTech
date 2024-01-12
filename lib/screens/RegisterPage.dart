import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:retech/SharedCode.dart';
import 'package:retech/screens/HomePage.dart';
import 'package:retech/screens/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? strPostMessage;
  late String errormsg;
  late bool error, showprogress;
  late TextEditingController txtFieldUsername;
  late String username, password, fullname, email;
  var _username = TextEditingController();
  var _fullname = TextEditingController();
  var _password = TextEditingController();
  var _email = TextEditingController();
  var _noHp = TextEditingController();
  var _ = TextEditingController();
  File? imageProfile;

  @override
  void initState() {
    fullname = "";
    username = "";
    password = "";
    email = "";
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
          color: Color.fromARGB(255, 151, 0, 208),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  'Buat Akun',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Silahkan masuk untuk melanjutkan',
                  style: TextStyle(color: Colors.white),
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
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _email,
                  onChanged: (value) {
                    email = value;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _fullname,
                  onChanged: (value) {
                    fullname = value;
                  },
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text(
                      'Daftar',
                      style:
                          TextStyle(color: Color.fromARGB(255, 125, 54, 254)),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () async {
                      postData();
                      showAlertDialog(context);
                    },
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah Punya Akun?',
                      style:
                          TextStyle(color: Color.fromARGB(179, 255, 255, 255)),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: Text(
                          'Masuk',
                          style: TextStyle(color: Colors.white),
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

  SnackBar postRegisteration(String? strPostMessage) {
    return SnackBar(
      content: Text(strPostMessage!),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Pendaftaran Berhasil"),
      content: Text("Silahkan cek email untuk verifikasi"),
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

  Future<void> postData() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);

      var url =
          Uri.parse('https://api.adminmateripintar.com/user/register.php');
      var request = http.MultipartRequest('POST', url);
      request.fields['c_nama_siswa'] = _fullname.text;
      request.fields['c_email_siswa'] = _email.text;
      request.fields['c_kelas_siswa'] = '10A';
      request.fields['c_nohp_siswa'] = '08123456789';
      request.fields['c_pin_siswa'] = '123456';
      request.fields['c_user_password'] = _password.text;
      request.files.add(
          await http.MultipartFile.fromPath('c_file_gambar_siswa', file.path));

      http.StreamedResponse response = await request.send();
      if (response.statusCode == HttpStatus.ok) {
        final responseJson = jsonDecode(await response.stream.bytesToString());
        if (responseJson['error'] == false) {
          print('Data posted successfully');
          setState(() {
            strPostMessage =
                'Pendaftaran berhasil. Silakan cek email untuk verifikasi.';
            postRegisteration(strPostMessage);
          });
        } else {
          print(responseJson['message']);
          setState(() {
            strPostMessage = 'Pendaftaran gagal. ${responseJson['message']}';
            postRegisteration(strPostMessage);
          });
        }
      } else {
        print('Error posting data: ${response.statusCode}');
      }
    }
  }

  startRegister() async {
    String apiurl = "${SharedCodes.apiUrl}/user/register.php"; //api url
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP
    print(username);
    print(password);

    final response = await http.post(Uri.parse(apiurl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          // "c_kelas_siswa": fileName,
          // "c_nohp_siswa": fileName,
          "c_username": _username.text, //get the username text
          "c_password": _password.text, //get password text
          "c_fullname": _fullname.text, //get password text
          "c_email": _email.text,
        }));

    print(response.statusCode);
    print(response.body.toString());

    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata["message"] != null) {
        setState(() {
          showprogress = false; //don't show progress indicator
          error = true;
          errormsg = jsondata["message"];
        });
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', jsondata["token"]);
        setState(() {
          error = false;
          showprogress = false;
          print(jsondata["token"]);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginPage()));
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
