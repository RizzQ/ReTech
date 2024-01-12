import 'package:flutter/material.dart';
import 'package:retech/SharedCode.dart';
// import 'package:retech/screens/HistoryPage.dart';
import 'package:retech/screens/LoginPage.dart';
// import 'package:retech/screens/MenuTransaksi.dart';
import 'package:retech/screens/NotifikasiPage.dart';
// import 'package:retech/screens/PromoPage.dart';
import 'package:retech/screens/SettingPage.dart';
// import 'package:retech/screens/MapelPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;


// ...

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: SharedCodes.primary,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50, top: 75, bottom: 25),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/profile.png'),
                            SizedBox(
                              height: 10,
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
                        Spacer(),
                        IconButton(
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => NotifikasiPage())));
                            },
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ))
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
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Pilih Kelas',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 5, bottom: 5),
                                    constraints: BoxConstraints(
                                        minWidth: 100,
                                        maxWidth: double.infinity),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: SharedCodes.borderfillKelas,
                                        border: Border.all(
                                            color: SharedCodes.borderKelas)),
                                    child: Text('VII - Kurikulum Merdeka')))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                          width: double.infinity, child: Text('Belajar Yuk?')),
                      SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Spacer(),
                      //     MyCardItem("Buku Materi",
                      //         'assets/icons/buku_materi.png', MapelKategori()),
                      //     Spacer(),
                      //     MyCardItem("Soal Quiz", 'assets/icons/quiz_icon.png',
                      //         QuizPage()),
                      //     Spacer()
                      //   ],
                      // ),
                      SizedBox(
                        height: 25,
                      ),
                      // InkWell(
                      //     onTap: () async {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: ((context) => PromoPage())));
                      //     },
                      //     child: Image.asset('assets/images/poster1.png')),
                      // SizedBox(
                      //   height: 25,
                      // ),
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
                        height: 15,
                      ),
                      // SizedBox(
                      //   height: 175,
                      //   width: double.infinity,
                      //   child: FutureBuilder<List<Artikel>>(
                      //     future: _fetchArtikel(),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasData) {
                      //         List<Artikel>? data = snapshot.data;
                      //         return _artikelListView(data);
                      //       } else if (snapshot.hasError) {
                      //         return Text("${snapshot.error}");
                      //       }
                      //       return Center(child: CircularProgressIndicator());
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   focusColor: Colors.white,
        //   backgroundColor: Colors.white,
        //   onPressed: () {},
        //   child: Container(
        //       padding: EdgeInsets.all(12),
        //       child: Image.asset('assets/qrcode.png')),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: BottomAppBar(
        //   shape: CircularNotchedRectangle(),
        //   notchMargin: 10,
        //   child: Container(
        //     height: 60,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: <Widget>[
        //         BottomNavButton('Home', Icons.home),
        //         BottomNavigatorButton('Transaksi', Icons.credit_card, MenuTransaksi()),
        //         MaterialButton(
        //           onPressed: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => PromoPage()),
        //             );
        //           },
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               SizedBox(
        //                 height: 25,
        //               ),
        //               Text(
        //                 'Paket',
        //                 style: TextStyle(color: Colors.grey[600]),
        //               )
        //             ],
        //           ),
        //         ),
        //         BottomNavigatorButton('History', Icons.book, HistoryPage()),
        //         BottomNavigatorButton('Settings', Icons.settings, SettingPage())
        //       ],
        //     ),
        //   ),
        // )
        );
  }
}

class MyCardItem extends StatelessWidget {
  String title;
  String iconData;
  var navPush;

  MyCardItem(this.title, this.iconData, this.navPush);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => navPush)));
        },
        child: Container(
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
        ));
  }
}

class BottomNavButton extends StatelessWidget {
  String bottomTitle;
  var iconBottom;
  BottomNavButton(this.bottomTitle, this.iconBottom);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconBottom,
            color: Colors.grey[600],
          ),
          Text(
            bottomTitle,
            style: TextStyle(color: Colors.grey[600]),
          )
        ],
      ),
    );
  }
}

class BottomNavigatorButton extends StatelessWidget {
  String bottomTitle;
  var iconBottom;
  var bottomNavigate;
  BottomNavigatorButton(this.bottomTitle, this.iconBottom, this.bottomNavigate);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => bottomNavigate)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconBottom,
            color: Colors.grey[600],
          ),
          Text(
            bottomTitle,
            style: TextStyle(color: Colors.grey[600]),
          )
        ],
      ),
    );
  }
}

// ListView _artikelListView(data) {
//   return ListView.builder(
//       physics: ClampingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       itemCount: data.length,
//       itemBuilder: (context, index) {
//         return ArtikelCard(
//           data[index].id_artikel,
//           data[index].img_artikel,
//           data[index].nama_artikel,
//           data[index].penulis_artikel,
//           data[index].file_artikel,
//           data[index].tanggal_rilis_artikel,
//         );
//       });
// }

// class ArtikelCard extends StatelessWidget {
//   String id_artikel;
//   String img;
//   String title;
//   String penulis_artikel;
//   String file_artikel;
//   String tanggal_rilis_artikel;

//   ArtikelCard(this.id_artikel, this.img,this.title, this.penulis_artikel, this.file_artikel, this.tanggal_rilis_artikel);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: ((context) => ArtikelPage(id_artikel, title, file_artikel, tanggal_rilis_artikel, penulis_artikel))));
//       },
//       child: Container(
//         constraints: BoxConstraints(
//             minWidth: 100, maxWidth: double.infinity, maxHeight: 500),
//         width: 200,
//         height: 175,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1,
//               blurRadius: 3,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//         ),
//         margin: EdgeInsets.all(5),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 1,
//               child: Image.network(
//                 '${SharedCodes.apiFile}/$img',
//                 fit: BoxFit.contain,
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 padding: EdgeInsets.all(6),
//                 alignment: Alignment.centerLeft,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           color: Color.fromARGB(255, 0, 0, 0)),
//                     ),
//                     SizedBox(
//                       height: 2,
//                     ),
//                     Text(
//                       penulis_artikel,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w300,
//                           fontSize: 12,
//                           color: Color.fromARGB(255, 0, 0, 0)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Future<List<Artikel>> _fetchArtikel() async {
//   final ArtikelListAPIUrl = '${SharedCodes.apiArtikel}/getlist.php';

//   //Get API
//   var request = http.MultipartRequest('GET', Uri.parse(ArtikelListAPIUrl));

//   //post request ke API dan simpan return-nya ke variabel response
//   var response = await request.send();

//   //convert response ke format JSON supaya bisa diparsing
//   var responsed = await http.Response.fromStream(response);
//   List<dynamic> responseData = json.decode(responsed.body);

//   List jsonResponse = responseData;

//   if (response.statusCode == 200) {
//     var o = jsonResponse.map((mapel) => new Artikel.fromJson(mapel)).toList();

//     return o;
//   } else {
//     throw Exception('Failed to load jobs from API');
//   }
// }
