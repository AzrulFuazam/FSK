import 'package:flutter/material.dart';
import 'package:fsk/model/navigation_item.dart';
import 'package:fsk/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

Widget domainitem(
  BuildContext context, {
  required NavigationItem domainitem,
  
}) {
  final provider = Provider.of<NavigationProvider>(context);
  final currentItem = provider.navigationItem;
  final isSelected = domainitem == currentItem;

  final color = isSelected ? Colors.orangeAccent : Colors.white;
  return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: () => selectItem(context, domainitem),
      ),
    );
}
 void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }
