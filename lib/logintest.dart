import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fsk/google_sign_in/googlesignin.dart';
import 'package:fsk/menu_bar/laman_utama.dart';
import 'package:fsk/google_sign_in/googlesignin.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF40E0D0),
        title: Text('Logged In'),
        centerTitle: true,
        elevation: 0,
        actions: [
          TextButton(
            child: Text('Logout'),
            onPressed: () {
              final provider =
                  Provider.of<googlesignin>(context, listen: false);
              provider.logout();
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Color(0XFF40E0D0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user!.photoURL!),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user!.displayName!,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user!.email!,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Rn: ' + user!.uid,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => laman_utama()),
                  );
                },
                child: Text("Teruskan")),
          ],
        ),
      ),
    );
  }
}
