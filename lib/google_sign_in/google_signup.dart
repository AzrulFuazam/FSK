import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fsk/log_masuk.dart';
import 'package:fsk/google_sign_in/googlesignin.dart';

class googlesignup extends StatelessWidget {
  var Provider;

  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(4),
        child: OutlinedButton.icon(
          label: const Text(
            'Sign In With Google',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          icon: const FaIcon(FontAwesomeIcons.google, color: Colors.amber),
          onPressed: () {
            final signin = Provider.of<googlesignin>(context, listen: false);
            signin.login();
          },
        ),
      );
}
