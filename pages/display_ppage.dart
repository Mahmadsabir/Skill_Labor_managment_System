//import 'package:app/main.dart';
import 'package:app/pages/user_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app/models/user.dart';

class LabourInfo extends StatefulWidget {
  @override
  State<LabourInfo> createState() => _LabourInfoState();
}

class _LabourInfoState extends State<LabourInfo> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('AVAILABLE WORKERS'),
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
        backgroundColor: Colors.grey,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => UserPage()),
            ));
          },
        ),
      );

  Widget buildUser(User user) => ListTile(
        // leading: CircleAvatar(child: Text('${user.mobile}')),
        title: Text(user.name),
        subtitle: Text(user.mobile.toString()),
      );

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('electrician')
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

  User({
    this.id = '',
    required this.name,
    required this.mobile,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'mobile': mobile,
        'name': name,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        mobile: json['mobile'],
        name: json['name'],
      );
}
