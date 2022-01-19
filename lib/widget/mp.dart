import 'package:flutter/material.dart';
import 'package:fsk/model/navigation_item.dart';
import 'package:fsk/provider/navigation_provider.dart';
import 'package:provider/provider.dart';
import '../menu_bar/domain.dart';
import '../menu_bar/header_page.dart';
import '../menu_bar/laman_utama.dart';
import '../menu_bar/log_keluar.dart';
import '../menu_bar/plugins_page.dart';
import '../menu_bar/profil.dart';
import '../menu_bar/updates_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.header:
        return HeaderPage();
      case NavigationItem.profil:
        return profil();
      case NavigationItem.lamanUtama:
        return laman_utama();
      case NavigationItem.workflow:
        return domain();
      case NavigationItem.updates:
        return UpdatesPage();
      case NavigationItem.plugins:
        return PluginsPage();
      case NavigationItem.notifications:
        return log_keluar();
    }
  }
}
