//import 'dart:html';

import 'package:app/main.dart';
import 'package:app/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'global.dart' as globals;

class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final controllerfname = TextEditingController();
  final controllermobile = TextEditingController();
  final controllerlname = TextEditingController();
  final controllerskill = TextEditingController();
  final controllerlocation = TextEditingController();

  // void _showDialog() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Successful'),
  //           content: Text('Your request has been sent'),
  //           actions: [
  //             MaterialButton(
  //               onPressed: () {},
  //               child: Text('ALLOW'),
  //             )
  //           ],
  //         );
  //       });
  // }
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  //File? file;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    // final path = result.files.single.path!;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  // Future uploadFile() async {
  //   final path = 'files/${pickedFile!.name}';
  //   final file = File(pickedFile!.path!);

  //   final ref = FirebaseStorage.instance.ref().child(path);
  //   uploadTask = ref.putFile(file);
  //   globals.urlLink = ref.getDownloadURL().toString();
  // }

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 25, 33, 97),
              Color.fromARGB(255, 25, 33, 97),
            ])),
        child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  icon: Icon(Icons.arrow_back,
                      color: Color.fromARGB(255, 29, 2, 125))),
              // leading: Icon(
              //   Icons.arrow_back_ios_new_rounded,
              //   color: Colors.black,
              // ),
              title: Text(
                'Add Details',
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 2, 125),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.white),
          backgroundColor: Colors.transparent,
          body: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              const SizedBox(height: 40),
              Container(
                height: 20,
                width: 100,
                child: TextField(
                    controller: controllerfname,
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(31, 32, 21, 188)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      fillColor: Colors.transparent,
                      hintText: "First Name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    cursorColor: Color.fromARGB(255, 201, 202, 204),
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: 40),
              Container(
                height: 20,
                width: 100,
                child: TextField(
                    controller: controllerlname,
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(31, 32, 21, 188)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      fillColor: Colors.transparent,
                      hintText: "Last Name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    cursorColor: Colors.blueAccent,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: 40),
              Container(
                height: 20,
                width: 100,
                child: TextField(
                    controller: controllermobile,
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(31, 32, 21, 188)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      fillColor: Colors.transparent,
                      hintText: "Mobile No",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    cursorColor: Colors.blueAccent,
                    keyboardType: TextInputType.number),
              ),
              SizedBox(height: 40),
              Container(
                height: 20,
                width: 100,
                child: TextField(
                    controller: controllerskill,
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(31, 32, 21, 188)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      fillColor: Colors.transparent,
                      hintText: "Skill",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    cursorColor: Colors.blueAccent,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: 40),
              Container(
                height: 20,
                width: 100,
                child: TextField(
                    controller: controllerlocation,
                    style: GoogleFonts.karla(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(31, 32, 21, 188)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      fillColor: Colors.transparent,
                      hintText: "Location",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    cursorColor: Colors.blueAccent,
                    keyboardType: TextInputType.text),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Please upload your labour card',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              _uploadBtn(),
              SizedBox(height: 40),
              _submitRBtn(),
            ],
          ),
        ),
      );

  Future createUser(User user) async {
    if (controllerskill.text.toLowerCase() == "chef") {
      final docUser = FirebaseFirestore.instance.collection('chef').doc();
      user.id = docUser.id;
      final json = user.toJson();
      await docUser.set(json);
    } else if (controllerskill.text.toLowerCase() == "electrician") {
      final docUser =
          FirebaseFirestore.instance.collection('electrician').doc();
      user.id = docUser.id;
      final json = user.toJson();
      await docUser.set(json);
    } else if (controllerskill.text.toLowerCase() == "plumber") {
      final docUser = FirebaseFirestore.instance.collection('plumber').doc();
      user.id = docUser.id;
      final json = user.toJson();
      await docUser.set(json);
    } else if (controllerskill.text.toLowerCase() == "painter") {
      final docUser = FirebaseFirestore.instance.collection('painter').doc();
      user.id = docUser.id;
      final json = user.toJson();
      await docUser.set(json);
    }
  }

  Widget _submitRBtn() {
    return InkWell(
      onTap: () async {
        final path = 'files/${pickedFile!.name}';
        final file = File(pickedFile!.path!);

        final ref = FirebaseStorage.instance.ref().child(path);
        uploadTask = ref.putFile(file);
        String urlLink = await ref.getDownloadURL();
        final snapshot = await uploadTask!.whenComplete(() {});
        final urlDownload = await snapshot.ref.getDownloadURL();

        setState(() {
          uploadTask = null;
        });

        final user = User(
            id: controllerlocation.text,
            name: controllerfname.text,
            lname: controllerlname.text,
            mobile: int.parse(controllermobile.text),
            skill: controllerskill.text,
            location: controllerlocation.text.toLowerCase(),
            url: urlLink);
        createUser(user);
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Registered'),
                content: Text('Registration Successfull'),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text('OKAY'),
                  )
                ],
              );
            });
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
              "REGISTER",
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

  Widget _uploadBtn() {
    return InkWell(
      onTap: selectFile,
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
              "UPLOAD",
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

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 30,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text(
                    '${(100 * progress.roundToDouble())}%',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox(height: 30);
        }
      });
}
