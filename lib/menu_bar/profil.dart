import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fsk/data/user.dart';
import 'package:fsk/widget/navigation_drawer.dart';

class profil extends StatelessWidget {
  // List listItems = ["Autisme", "Cerebral Pasy"];
  // String valueChoose;
  final items = ['Autisme', 'Cerebral Plasy', 'ADHD', 'Down Syndrome'];
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController kataLaluan = TextEditingController();
  TextEditingController doktor = TextEditingController();
  TextEditingController medikasi = TextEditingController();
  TextEditingController namaBapa = TextEditingController();
  TextEditingController hubungan = TextEditingController();
  TextEditingController nomborTelefon = TextEditingController();

  final Firebase = FirebaseFirestore.instance;

  update() async {
    try {
      Firebase.collection("User").doc(nama.text).update({
        "alamat": alamat.text,
        "kataLaluan": kataLaluan.text,
        "doktor": doktor.text,
        "medikasi": medikasi.text,
        "namaBapa": namaBapa.text,
        "hubungan": hubungan.text,
        "nomborTelefon": nomborTelefon.text,
      });
    } catch (e) {
      print(e);
    }
  }

  create() async {
    try {
      await Firebase.collection("User").doc(nama.text).set({
        "nama": nama.text,
        "alamat": alamat.text,
        "kataLaluan": kataLaluan.text,
        "doktor": doktor.text,
        "medikasi": medikasi.text,
        "namaBapa": namaBapa.text,
        "hubungan": hubungan.text,
        "nomborTelefon": nomborTelefon.text,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Profil'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text(
                  "Maklumat Pesakit",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(user!.photoURL!))),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30, //saiz kotak input
                ),
                TextField(
                    controller: nama,
                    decoration: InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: alamat,
                    decoration: InputDecoration(
                        labelText: 'Alamat',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: kataLaluan,
                    decoration: InputDecoration(
                        labelText: 'Kata Laluan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: doktor,
                    decoration: InputDecoration(
                        labelText: 'Nama Terapi',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: medikasi,
                    decoration: InputDecoration(
                        labelText: 'Dianosa',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  height: 30, //saiz kotak input
                ),
                //DropdownButton<String>(items:items.map(buildMenuItem).toList(),

                Text(
                  "Maklumat Penjaga",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: namaBapa,
                    decoration: InputDecoration(
                        labelText: 'Nama',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: hubungan,
                    decoration: InputDecoration(
                        labelText: 'Hubungan',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: nomborTelefon,
                    decoration: InputDecoration(
                        labelText: 'Nombor Telefon',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        update();
                      },
                      child: Text("Create"),
                    )
                  ],
                  /* mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      color: Color(0XFF40E0D0),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "KemasKini",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    )
                  ],*/
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      );
}
