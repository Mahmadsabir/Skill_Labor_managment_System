import 'dart:ffi';

import 'package:app/pages/cust_btn_page.dart';
import 'package:app/pages/display_ppage.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        //   title: const Text('Kindacode.com'),
        // ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(2.5)),
                    child: Image.asset(
                      'assets/new1.png',
                      //fit: BoxFit.cover,
                      height: 180,
                      width: 180,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'WELCOME TO ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'SKILL LABOUR MANAGEMENT',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'SYSTEM ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 200,
                    width: 240,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 94, 94, 114),
                            Color.fromARGB(255, 3, 25, 111),
                          ]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      // color: Colors.transparent,
                      border: Border.all(
                        color: Color.fromARGB(255, 12, 6, 129),
                        width: 0.0,
                      ),
                    ),
                    child: Column(children: [
                      SizedBox(height: 45),
                      _customerBtn(),
                      SizedBox(height: 35),
                      _registerBtn(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customerBtn() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
          child: Container(
            alignment: new FractionalOffset(0.5, 0.2),
            width: 130,
            height: 27,
            child: Text(
              "CUSTOMER",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 29, 2, 125),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerBtn() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPage()),
        );
      },
      child: Material(
        elevation: 5,
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
          child: Container(
            alignment: new FractionalOffset(0.5, 0.2),
            width: 130,
            height: 27,
            child: Text(
              "REGISTER",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 29, 2, 125),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
