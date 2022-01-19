import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:firebase/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Question extends StatefulWidget {
  String _isImage =
      'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
  String _age = '';
  String _Questions = '';
  String responds = '';

  List<String> feedback = List.empty(growable: true);
  //List<TextEditingController> wan = List<TextEditingController>.generate(30, (index) => );
  Question(this._isImage, this._age, this._Questions, this.responds) {}

  String get isQuestion => _Questions;

  set isQuestion(String? Questions) {
    _Questions = Questions!;
  }

  set phoneNumber(String? phoneNumber) {}

  String get isImage => _isImage;

  set isImage(String? image) {
    _isImage = image!;
  }

  String get Age => _age;
  set Age(String value) {
    _age = value;
  }

  DropdownMenuItem<String> buildMenuItem(String tandainitial) =>
      DropdownMenuItem(
        value: tandainitial,
        child: Text(tandainitial),
      );

  final tanda = ['/', 'X', '-', 'TB', 'DEF'];
  List<String> tandainitial = List.filled(30, 'DEF');
  Widget buildtanda(int tandaintial) {
    List<String> tandainitial = List.filled(30, 'DEF');
    for (tandaintial; tandaintial < 27; tandaintial++) {
      return Container(
          child: Column(
        children: [
          Text('${tandaintial}'),
          DropdownButton<String>(
              alignment: Alignment.center,
              value: tandainitial[tandaintial],
              items: tanda.map(buildMenuItem).toList(),
              onChanged: (tanda) =>
                  // setState(
                  () => tandainitial[tandaintial] = tanda!
              // ),
              ),
        ],
      ));
    }
    return Text(' ');
  }

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Question() {
    Widget buildtanda(int tandaintial) {
      List<String> tandainitial = List.filled(30, 'DEF');
      for (tandaintial; tandaintial < 27; tandaintial++) {
        return Container(
            child: Column(
          children: [
            Text('${tandaintial}'),
            DropdownButton<String>(
              alignment: Alignment.center,
              value: tandainitial[tandaintial],
              items: tanda.map(buildMenuItem).toList(),
              onChanged: (tanda) =>
                  setState(() => tandainitial[tandaintial] = tanda!),
            ),
          ],
        ));
      }
      return Text('kILL ');
    }
  }

  DropdownMenuItem<String> buildMenuItem(String tandainitial) =>
      DropdownMenuItem(
        value: tandainitial,
        child: Text(tandainitial),
      );
  final tanda = ['/', 'X', '-', 'TB', 'DEF'];
  List<String> tandainitial = List.filled(30, 'DEF');

  @override
  Widget build(BuildContext context) {
    DropdownMenuItem<String> buildMenuItem(String tandainitial) =>
        DropdownMenuItem(
          value: tandainitial,
          child: Text(tandainitial),
        );
    final tanda = ['/', 'X', '-', 'TB', 'DEF'];
    List<String> tandainitial = List.filled(30, 'DEF');
    Widget buildtanda(int tandaintial) {
      List<String> tandainitial = List.filled(30, 'DEF');
      for (tandaintial; tandaintial < 27; tandaintial++) {
        return Container(
            child: Column(
          children: [
            Text('${tandaintial}'),
            DropdownButton<String>(
              alignment: Alignment.center,
              value: tandainitial[tandaintial],
              items: tanda.map(buildMenuItem).toList(),
              onChanged: (tanda) =>
                  setState(() => tandainitial[tandaintial] = tanda!),
            ),
          ],
        ));
      }
      return Text('kILL ');
    }

    return Container();
  }
}
