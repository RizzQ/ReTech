import 'package:flutter/material.dart';
import 'package:retech/SharedCode.dart';
// import 'package:retech/screens/HistoryPage.dart';
import 'package:retech/screens/LoginPage.dart';
// import 'package:retech/screens/MenuTransaksi.dart';
import 'package:retech/screens/NotifikasiPage.dart';
import 'package:retech/screens/PromoPage.dart';
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
    // setState(() {
    //   fullname = prefs.getString("fullname");
    // });
  }

  @override
  Widget build(BuildContext context) {
    int myCurrentIndex = 0;
    List pages = const [
      //nggo ngisi list page sing meh di nggo navbar
    ];
    List dataPromo = [
      {"gambar": 'assets/img/Promo1.png'},
      {"gambar": 'assets/img/Promo2.png'},
      {"gambar": 'assets/img/Promo1.png'}
    ];
    List dataPesan = [
      {
        "product": "Servis - AC",
        "date": "31 Des, 2023",
        "jam": "07:30",
        "harga": "130.000,00"
      },
      {
        "product": "Servis - Kulkas",
        "date": "30 Des, 2023",
        "jam": "10:13",
        "harga": "330.000,00"
      },
      {
        "product": "Servis - Oven",
        "date": "29 Des, 2023",
        "jam": "19:59",
        "harga": "100.000,00"
      }
    ];
    List dataServis = [
      {
        "product": "Air Conditioner (AC)",
        "desc": "AC Anda sudah tidak dingin? Perbaiki sekarang.",
        "img": "07:30",
      },
      {
        "product": "Kulkas",
        "desc": "Kulkas Anda memakan watt? Jangan Khawatir.",
        "img": "10:13",
      },
      {
        "product": "Kipas",
        "desc": "Kipas Anda tidak berputar? Teknisi kami siap.",
        "img": "19:59",
      }
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My App'),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(30),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: SharedCodes.primary,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 35.0, right: 35, top: 75, bottom: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/img/Logo.png'),
                              SizedBox(
                                height: 10,
                              ),
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
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          onChanged: (value) {
                            username = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Search',
                              labelStyle: TextStyle(color: Colors.grey)),
                        ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang, Daniyal',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 2.0),
                          child: Container(
                            height: 200,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              margin: EdgeInsets.only(
                                bottom: 16,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/img/Homepage.png'),
                                      Spacer(),
                                      Flexible(
                                          flex: 10,
                                          child: Text(
                                            "Perlu peralatan Anda diperbaiki? Hubungi salah satu teknisi terbaik kami.",
                                          ))
                                    ],
                                  ),
                                  Container(
                                    width: 2,
                                    height: 2,
                                    decoration: ShapeDecoration(
                                      shape: CircleBorder(),
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => PromoPage())));
                          },
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(),
                              color: Colors.transparent,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: DecoratedBox(
                                child: Center(
                                  child: Text(
                                    'Pesan',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: SharedCodes.primary,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: 500,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: dataPromo.length,
                        itemBuilder: (ctx, index) {
                          return Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) => PromoPage())));
                                },
                                child: Image.asset(
                                  dataPromo[index]["gambar"],
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Riwayat Pesan',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          child: Text("Lebih lengkap"),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xffF0F0F0),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Image.asset(
                                          'assets/icon/keranjang.png'),
                                    ),
                                    SizedBox(width: 3,),
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(dataPesan[index]["product"]),
                                          Text(dataPesan[index]["date"]),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(dataPesan[index]["harga"]),
                                          Text(dataPesan[index]["jam"]),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Servis Kami',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Spacer(),
                    //     MyCardItem("Buku Materi",
                    //         'assets/icons/buku_materi.png', PromoPage()),
                    //     Spacer(),
                    //     MyCardItem("Soal Quiz", 'assets/icons/quiz_icon.png',
                    //         PromoPage()),
                    //     Spacer()
                    //   ],
                    // ),
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
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 25,
            // offset: const Offset(8, 20))
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              backgroundColor: Color(0xffF2F2F2),
              selectedItemColor: Colors.redAccent,
              unselectedItemColor: Colors.black,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history_edu), label: "History"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_sharp), label: "Profile"),
              ]),
        ),
      ),
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
