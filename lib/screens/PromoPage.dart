import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:retech/SharedCode.dart';
import 'package:retech/SharedCode.dart';
import 'package:retech/models/PromoModel.dart';
import 'package:retech/models/PaketModel.dart';
// import 'package:retech/screens/PromoDetailPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({Key? key}) : super(key: key);
@override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  String? idSiswa;
  late String errormsg;
  late bool error, showprogress;
  @override
  void initState() {
    // TODO: implement initState
    errormsg = "";
    error = false;
    showprogress = false;
    getStringValuesSF();
    super.initState();
  }
  
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      idSiswa = prefs.getString("iduser");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Paket'),
          backgroundColor: SharedCodes.secondary,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50, left: 35,right: 35),
          child: SingleChildScrollView(
          child: Center(
            child: MapelListView()
            
          ),
      ),
        ),);
  }
}

class MapelListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Paket>>(
      future: _fetchHistory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Paket>? data = snapshot.data;
          return _materiListBuilder(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _materiListBuilder(data) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return HistoryList(
            data[index].id_paket_header,
            data[index].nama_paket,
            data[index].kelas_paket,
            data[index].gambar_paket,
            data[index].keterangan_paket,
            data[index].harga_paket,
          );
        });
  }

  Future<List<Paket>> _fetchHistory() async {
    String? idSiswa;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idSiswa = prefs.getString("iduser");

    final HistoryListAPIUrl = '${SharedCodes.apiPaket}/getlist.php';
    var request = http.MultipartRequest('GET', Uri.parse(HistoryListAPIUrl));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    
    if (response.statusCode == 200) {
      List<dynamic> jsondata = json.decode(responsed.body);
      var o = jsondata.map((history) => new Paket.fromJson(history)).toList();
      return o;
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
class HistoryList extends StatelessWidget {
  String id_promo,
      nama_promo,
      kelas_promo,
      img_promo,
      keterangan_promo,
      harga_promo
      ;
  HistoryList(this.id_promo, this.nama_promo, this.kelas_promo, this.img_promo,
      this.keterangan_promo, this.harga_promo);

      @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 150,
                          child: Image.network(
                            '${SharedCodes.apiFile}/${img_promo}',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                           Text('SMP Kelas 7', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                           SizedBox(height: 15,),
                           Row(
                             children: [
                               Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(38, 187, 12, 254),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                    Icon(Icons.lock,color: SharedCodes.primary),
                                     Text('Matematika'),
                                   ],
                                 ),
                               ),
                               SizedBox(width: 5,),
                               Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(38, 187, 12, 254),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                    Icon(Icons.lock,color: SharedCodes.primary,),
                                     Text('Fisika'),
                                   ],
                                 ),
                               ),
                             ],
                           ),
                           SizedBox(height: 15,),
                           Text('Mulai dari', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),),
                           Row(
                            children: [
                              Text('IDR $harga_promo',style: TextStyle(
                                fontSize: 25
                              ),),
                              Spacer(),
                              SizedBox(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(onPressed: () async {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: ((context) =>
                                      //         PromoDetailPage(id_promo, nama_promo, keterangan_promo, kelas_promo, img_promo, harga_promo))));
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      primary: SharedCodes.primary
                                    ),
                                    child: Text('Cek Detail')),
                              )
                            ],
                           )
                          ]),
                      )
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            );
    }
}