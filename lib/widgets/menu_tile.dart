import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/theme/styles.dart';
import 'tap_slash_item.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key? key,
    required this.title,
    required this.icon,
    this.subtitle = '',
    this.trailingWidget,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final String? subtitle;
  final Widget? trailingWidget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 60,
      width: double.infinity,
      child: onPressed == null
          ? _item()
          : TapSlashItem(
              onPressed: onPressed,
              itemRadius: 20,
              child: _item(),
            ),
    );
  }

  Widget _item() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            icon,
            color: accentColor,
            size: 24,
          ),
          SizedBox(width: 30),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Visibility(
                    visible: subtitle != '',
                    child: Text(
                      subtitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: accentColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          trailingWidget ??
              Icon(
                CupertinoIcons.chevron_right,
                color: accentColor,
                size: 16,
              ),
        ],
      ),
    );
  }
}
