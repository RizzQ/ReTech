import 'package:flutter/material.dart';
import 'package:retech/screens/HomePage.dart';
import 'package:retech/screens/RegisterPage.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController txtFieldUsername;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
            child: Container(
              color: Colors.purple,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login Akun',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25
                    ),),
                    SizedBox(height: 25,),
                    Text(
                      'Silahkan masuk untuk melanjutkan',
                      style: TextStyle(
                      color: Colors.white
                    ),),
                    SizedBox(height: 50,),
                  const TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        // filled: true,
                        // fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 25,),
                    const TextField(
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    ),
                    Row(
                      children: [
                        Text('Belum Punya Akun? '),
                        TextButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      }, child: Text('Daftar')),
                      ],
                    )
                ],),
              ),
            ),
          ),
    );
  }
}