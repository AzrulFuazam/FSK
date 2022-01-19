import 'package:flutter/material.dart';
import 'package:fsk/google_sign_in/googlesignin.dart';
import 'package:fsk/widget/navigation_drawer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class log_keluar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Log keluar'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
      );
}
