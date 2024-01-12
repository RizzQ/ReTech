import 'package:flutter/material.dart';
import 'package:retech/SharedCode.dart';
import 'package:retech/screens/HomePage.dart';
import 'package:retech/screens/LoginPage.dart';

class UbahSandiPage extends StatelessWidget {
  UbahSandiPage({Key? key}) : super(key: key);
  var Controller;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text(''), backgroundColor: SharedCodes.primary,),
      body: Center(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Password Baru', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                    ],
                  ),
                  SizedBox(height: 25,),
                  TextField(
                      style: TextStyle(color: Colors.white,),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Bimo',
                        
                      ),
                  ),
                  ElevatedButton(
                        child: const Text(
                          'Ubah',
                          style: TextStyle(
                            color: Color.fromARGB(255, 125, 54, 254)
                          ),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),],
            ),
            )
          ],
        ),
      
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
            SizedBox(height: 5,),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color:Color.fromARGB(255, 0, 0, 0)),),
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
      )
    );
  }
}