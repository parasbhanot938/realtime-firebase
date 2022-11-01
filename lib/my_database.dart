import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_database/model/chat_model.dart';

class DataBase extends StatefulWidget {
  const DataBase({Key? key}) : super(key: key);

  @override
  State<DataBase> createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  List<ChatModel> _list = [];
  ChatModel chatModel = ChatModel(name: "Paras", age: "12", mobile: "12121211");
  final realtimeDatabase = FirebaseDatabase.instance;

  @override
  void initState() {
    // debugPrint(realtimeDatabase.ref("Data").toString());
    myData();

    // realtimeDatabase.ref("Data").onChildRemoved.listen((event) {
    //   exit(0);
    // });

    // TODO: implement initState
    super.initState();
  }

/*==================================================================On child Changed====================================================================*/
  Future myData() async {
    realtimeDatabase.ref("Data").onChildChanged.listen((event) async {
      var data = await realtimeDatabase
          .ref("Data")
          .child("Apna Data")
          .get(); //getting data from our real tilme database
      debugPrint("${data.value}");
      Map tempData = jsonDecode(jsonEncode(data.value));
      _list = [];
      tempData.forEach((key, value) {
        ChatModel chatModel = ChatModel.fromJson(value);
        _list.add(chatModel);
      });
      debugPrint(_list[0].toJson().toString());
      _list.sort((a, b) {
        return a.dateTime!.compareTo(b.dateTime!);
      });
      setState(() {});
    });
  }

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("daabase"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, i) {
                    return Text(_list[i].name ?? "");
                  })),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                ),
              ),
              TextButton(
                  onPressed: () {
                    // realtimeDatabase.ref("Data").push().set({
                    //   "Id":"121",
                    //   "Class":"sectionn A"
                    // });
                    chatModel.name = messageController.value.text;
                    chatModel.dateTime = DateTime.now().toString();
                    realtimeDatabase.ref("Data").child("Apna Data").push().set(
                        chatModel
                            .toJson()); //pushing data or our model in real time database

                    // realtimeDatabase.reference(
                    // ).child("Data").push().set({
                    //   "name":"bhanot",
                    //   "about":"heyyy i am flutter developer",
                    //   "mobile":"82888282",
                    // });

                    // realtimeDatabase.ref("Data").onChildChanged;

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
                  child: Text("Next")),
            ],
          ),
        ],
      ),
    );
  }
}
