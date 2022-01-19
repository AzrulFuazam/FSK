import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fsk/google_sign_in/googlesignin.dart';
import 'package:fsk/menu_bar/laman_utama.dart';
import 'package:provider/provider.dart';
import 'package:fsk/widget/mp.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LogMasuk());
}

class LogMasuk extends StatefulWidget {
  _LogMasuk createState() => _LogMasuk();
}

class _LogMasuk extends State<LogMasuk> {
  final emailController = TextEditingController();
  final PassController = TextEditingController();
  final RegExp emailRegex = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  String password = '';
  final valuController = TextEditingController();
  bool isPasswordVisibles = true;

  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
    // PassController.addListener(() => setState(() {}));
    //valuController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => googlesignin()),
            //ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
            //ChangeNotifierProvider( create: (context) => EmailOTSignInProvider()),
          ],
          child: Scaffold(
              backgroundColor: Color(0XFF40E0D0),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text('Log Masuk'),
                centerTitle: true,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: OutlinedButton.icon(
                        label: Text(
                          'Log Masuk Menggunakan Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        icon: FaIcon(FontAwesomeIcons.google,
                            color: Colors.amber),
                        onPressed: () {
                          final provider =
                              Provider.of<googlesignin>(context, listen: false);
                          provider.googleLogin();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                      ),
                    ),
                    /*TextButton(
                        child: Text('Lupa kata laluan'),
                        onPressed: () {
                          print('forget password');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => forgotpass()),
                          );
                        }),
                    TextButton(
                        child: Text('Tidak mempunyai akaun ?Daftar'),
                        onPressed: () {
                          print('Sign up');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Option()),
                          );
                        })*/
                  ],
                ),
              )));
}
