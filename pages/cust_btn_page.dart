import 'package:app/pages/chef_display.dart';
import 'package:app/pages/display_ppage.dart';
import 'package:app/pages/electrician_display.dart';
import 'package:app/pages/painter_display.dart';
import 'package:app/pages/plumber_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerSkills extends StatefulWidget {
  @override
  State<CustomerSkills> createState() => _CustomerSkillsState();
}

class _CustomerSkillsState extends State<CustomerSkills>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController _reqlocation = TextEditingController();
  final String reqlocation = "";

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
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: const Text('SELECT REQUIERD LABOUR'),
        ),
        body: ListView(
          padding: EdgeInsets.all(50),
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 25,
              width: 100,
              child: TextField(
                  controller: _reqlocation,
                  style: GoogleFonts.karla(
                    color: Colors.white,
                    fontSize: 20,
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
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: Colors.transparent,
                    hintText: "Enter Requiered Location",
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.text),
            ),
            SizedBox(
              height: 50,
            ),
            _plumberBtn(),
            const SizedBox(height: 30),
            _ElectricianBtn(),
            const SizedBox(height: 30),
            _painterBtn(),
            const SizedBox(height: 30),
            _chefBtn(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _plumberBtn() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlumberInfo(reqlocation: _reqlocation.text)));
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
              "PLUMBER",
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

  Widget _painterBtn() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PainterInfo(reqlocation: _reqlocation.text)));
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
              "PAINTER",
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

  Widget _ElectricianBtn() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ElectricianInfo(reqlocation: _reqlocation.text)));
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
              "ELECTRICIAN",
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

  Widget _chefBtn() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChefInfo(reqlocation: _reqlocation.text)));
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
              "CHEF",
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
