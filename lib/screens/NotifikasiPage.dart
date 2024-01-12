import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:retech/SharedCode.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifikasi'), backgroundColor: SharedCodes.primary,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 105,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('20 Desember 2022', style: TextStyle(color: Colors.grey),),),
                      Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(text: 'Paket promo untuk bulan agustu... ', style: TextStyle(color: Colors.black))
                            ),
                            
                          ),
                          Text('13:00')
                        ],
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
