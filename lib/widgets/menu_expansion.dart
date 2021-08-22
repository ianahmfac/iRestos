import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuExpansion extends StatelessWidget {
  const MenuExpansion({
    Key? key,
    required this.title,
    required this.imageAsset,
    required this.subtitle,
    required this.items,
    this.isInitialExpanded = false,
  }) : super(key: key);
  final String title;
  final String imageAsset;
  final String subtitle;
  final List items;
  final bool isInitialExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      leading: Image.asset(
        imageAsset,
        width: 40,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.caption,
      ),
      initiallyExpanded: isInitialExpanded,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 8),
      children: items
          .map(
            (item) => ListTile(
              leading: Icon(CupertinoIcons.hand_thumbsup),
              title: Text(item.name),
            ),
          )
          .toList(),
    );
  }
}
