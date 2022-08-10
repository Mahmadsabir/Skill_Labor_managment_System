import 'package:app/pages/cust_btn_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 25, 33, 97),
            Color.fromARGB(255, 25, 33, 97),
          ])),
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Colors.black45,
        //   title: const Text('SELECT REQUIERD LABOUR'),
        // ),
        body: ListView(
          padding: EdgeInsets.only(top: 300, left: 20, right: 20),
          children: [
            Container(
              height: 25,
              width: 100,
              child: TextField(
                  // controller: controllerfname,
                  style: GoogleFonts.karla(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(231, 219, 219, 219)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 210, 217, 220)),
                    ),
                    fillColor: Colors.transparent,
                    hintText: "Name",
                    hintStyle: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text),
            ),
            SizedBox(height: 50),
            Container(
              height: 25,
              width: 100,
              child: TextField(
                  // controller: controllerfname,
                  style: GoogleFonts.karla(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(231, 219, 219, 219)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    fillColor: Colors.transparent,
                    hintText: "Mobile No",
                    hintStyle: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number),
            ),
            SizedBox(height: 50),
            _submitBtn(),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                'Back to home screen',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'sfprodisplay',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitBtn() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerSkills()),
        );
      },
      child: Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
          child: Container(
            alignment: new FractionalOffset(0.5, 0.2),
            width: 20,
            height: 35,
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 29, 2, 125),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
