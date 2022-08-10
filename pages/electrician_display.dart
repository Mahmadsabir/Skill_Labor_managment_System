//import 'package:app/main.dart';
import 'package:app/pages/user_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app/models/user.dart';
import 'global.dart' as globals;

class ElectricianInfo extends StatefulWidget {
  @override
  String reqlocation = "";
  ElectricianInfo({required this.reqlocation});
  State<ElectricianInfo> createState() => _ElectricianInfoState();
}

class _ElectricianInfoState extends State<ElectricianInfo> {
  @override
  Widget build(BuildContext context) {
    globals.rlocation = widget.reqlocation;
    return Scaffold(
      appBar: AppBar(
        title: Text('AVAILABLE WORKERS'),
        backgroundColor: Color.fromARGB(255, 29, 2, 125),
      ),
      // body: FutureBuilder<User?>(
      //     future: readUser(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         final user = snapshot.data;
      //         return user == null
      //             ? Center(child: Text('no user'))
      //             : buildUser(user);
      //       } else {
      //         return Center(child: CircularProgressIndicator());
      //       }

      body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Somthing went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: ((context) => UserPage()),
      //     ));
      //   },
      // ),
    );
  }

  Widget buildUser(User user) {
    return ListTile(
      // leading: CircleAvatar(child: Text('${user.mobile}')),
      trailing: InkWell(
        onTap: () {},
        child: Icon(Icons.call),
      ),
      // Container(
      //   child: Icon(Icons.call),
      // ),
      title: Text(
        user.name,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        user.mobile.toString(),
        style: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('electrician')
      //.where("location", isEqualTo: globals.rlocation & "isVerified", isNotEqualTo: "No")
      .where("location", isEqualTo: globals.rlocation)
      .where("isVerified", isEqualTo: "Yes")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

  Future<User?> readUser() async {
    final docUser = FirebaseFirestore.instance.collection('chef').doc('my-id');
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      if (snapshot.data == null) {
        print("no data");
      }

      return User.fromJson(snapshot.data()!);
    }
  }
}

class User {
  String id;
  final String name;
  final int mobile;
  final String location;
  final String skill;
  final String lname;

  User({
    this.id = '',
    required this.name,
    required this.mobile,
    required this.lname,
    required this.skill,
    required this.location,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'mobile': mobile,
        'name': name,
        'lname': lname,
        'skill': skill,
        'location': location,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        mobile: json['mobile'],
        name: json['name'],
        lname: json['lname'],
        skill: json['skill'],
        location: json['location'],
      );
}
