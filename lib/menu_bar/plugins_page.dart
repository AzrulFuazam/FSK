import 'package:flutter/material.dart';
import 'package:fsk/widget/navigation_drawer.dart';

class PluginsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Slot Kosong'),
          centerTitle: true,
          backgroundColor: Color(0XFF40E0D0),
        ),
      );
}
