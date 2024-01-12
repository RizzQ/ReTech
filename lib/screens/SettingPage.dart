import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:retech/SharedCode.dart';
import 'package:retech/screens/LoginPage.dart';
import 'package:retech/screens/ProfilePage.dart';
import 'package:retech/screens/UbahSandiPage.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? fullname, username, userImage;
  @override
  void initState() {
    getStringValuesSF();
    super.initState();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      fullname = prefs.getString("fullname");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: SharedCodes.primary,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: SharedCodes.primary,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 50.0, right: 8, top: 20, bottom: 20),
                child: Column(
                  children: [
                    fullname == '' ?
                    ElevatedButton(
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => LoginPage())));
                            },
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            child: Text(
                              'Masuk / Daftar',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 125, 54, 254)),
                            )) :
                    Row(
                      children: [
                        Image.asset('assets/profile.png'),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          fullname.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Akun',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => ProfilePage())));
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.edit,
                                  color: SharedCodes.primary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  color: Colors.white,
                                  child: Text('Ubah Profile'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  color: Colors.white,
                                  child: Icon(Icons.keyboard_arrow_right),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // InkWell(
                      //   onTap: () async {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: ((context) => UbahSandiPage())));
                      //   },
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Align(
                      //           alignment: Alignment.centerLeft,
                      //           child: Icon(
                      //             Icons.lock,
                      //             color: SharedCodes.primary,
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         flex: 5,
                      //         child: SizedBox(
                      //           width: double.infinity,
                      //           child: Align(
                      //             alignment: Alignment.centerLeft,
                      //             child: Container(
                      //               color: Colors.white,
                      //               child: Text('Ubah Password'),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Align(
                      //           alignment: Alignment.centerRight,
                      //           child: Container(
                      //             color: Colors.white,
                      //             child: Icon(Icons.keyboard_arrow_right),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 25,
                      ),
                      
                    ],
                  ),
                  Divider(
                    height: 75,
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Temukan Hal Baru Disini',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  listMenu('Pusat Bantuan'),
                  SizedBox(
                    height: 25,
                  ),
                  listMenu('Keuntungan Pakai Mapin'),
                  SizedBox(
                    height: 25,
                  ),
                  listMenu('Syarat dan Ketentuan'),
                  SizedBox(
                    height: 25,
                  ),
                  listMenu('Kebijakan Privasi'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class listMenu extends StatelessWidget {
  String title;
  listMenu(
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.edit, color: SharedCodes.primary),
          ),
        ),
        Expanded(
          flex: 5,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Colors.white,
              child: Text(title),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: Colors.white,
              child: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ),
      ],
    );
  }
}

class listMenu2 extends StatelessWidget {
  String listTitle;
  var navPush2;
  var listIcons;
  listMenu2(this.listTitle, this.navPush2, this.listIcons);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => navPush2)));
      },
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.edit, color: SharedCodes.primary),
            ),
          ),
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: Colors.white,
                child: Text(listTitle),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                color: Colors.white,
                child: Icon(
                  Icons.keyboard_arrow_right,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
