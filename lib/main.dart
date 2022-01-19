import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fsk/google_sign_in/googlesignin.dart';
import 'package:fsk/log_masuk.dart';
import 'package:fsk/widget/mp.dart';
import 'package:provider/provider.dart';
import 'package:fsk/model/navigation_item.dart';
import 'package:fsk/menu_bar/laman_utama.dart';
import 'package:fsk/menu_bar/log_keluar.dart';
import 'package:fsk/menu_bar/profil.dart';
import 'package:fsk/menu_bar/header_page.dart';
import 'package:fsk/menu_bar/plugins_page.dart';
import 'package:fsk/menu_bar/updates_page.dart';
import 'package:fsk/menu_bar/domain.dart';
import 'package:fsk/provider/navigation_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => googlesignin()),
          ChangeNotifierProvider(
              create: (context) => NavigationProvider()), //for navigationBar
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: MainPage(),
        ),
      );
}
