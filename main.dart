import 'package:app/pages/home_page.dart';
import 'package:app/pages/user_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: controller,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                final name = controller.text;
                createUser(name: name);
              },
            )
          ],
        ),
      );
  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = User(
      id: docUser.id,
      name: name,
      mobile: 9900,
      location: 'GandhiNagar',
      lname: 'Badami',
      skill: 'Plumber',
      url: '',
    );
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final String lname;
  final int mobile;
  final String skill;
  final String location;
  final String url;
  final String isVerified;

  User(
      {this.id = '',
      required this.name,
      required this.lname,
      required this.mobile,
      required this.skill,
      required this.location,
      required this.url,
      this.isVerified = 'No'});

  Map<String, dynamic> toJson() => {
        'id': id,
        'mobile': mobile,
        'name': name,
        'lname': lname,
        'skill': skill,
        'location': location,
        'url': url,
        'isVerified': isVerified,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        mobile: json['mobile'],
        name: json['name'],
        lname: json['lname'],
        skill: json['skill'],
        location: json['location'],
        url: json['url'],
        isVerified: json['isVerified'],
      );
}
