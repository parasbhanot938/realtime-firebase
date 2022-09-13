import 'dart:developer';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataBase extends StatefulWidget {
  const DataBase({Key? key}) : super(key: key);

  @override
  State<DataBase> createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  final realtimeDatabase = FirebaseDatabase.instance;

  @override
  void initState() {
    realtimeDatabase.ref("Data").onChildRemoved.listen((event) {
      exit(0);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("daabase"),

      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                realtimeDatabase.reference(
                ).child("Data").push().set({
                  "name":"bhanot",
                  "age":"2",
                  "mobile":"82888282",
                });

                realtimeDatabase.ref("Data").onChildChanged;


/*
                    cloudStore.collection("Paras").doc("oooooo").set({

                      "Name":"PPPPPPPP",


                    });*/


                /*  cloudStore.collection("Paras").doc("ccc").set({
                      "Name": "Paras Bhanot",

                    });*/


                /*.add({
                      "Name": "Paras Bhanot",
                      "id":"2"
                    });*/
                // GetUtils.isLengthGreaterThan(usernameController!.text, 6) ? print('Name is valid') : print('Name is invalid!!!');
                // GetUtils.isAlphabetOnly(passwordController!.text) ? print('Password is Valid') : print('Password is not valid');




              },
              child: Text("Next"))

        ],

      ),
    );
  }
}
