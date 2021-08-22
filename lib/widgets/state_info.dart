import 'package:flutter/material.dart';

import '../config/theme/styles.dart';

class StateInfo extends StatelessWidget {
  const StateInfo({
    Key? key,
    required this.title,
    required this.icon,
    this.isConnectionError = false,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isConnectionError;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              icon,
              size: 100,
              color: accentColor,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Visibility(
              visible: isConnectionError,
              child: TextButton(
                onPressed: onPressed,
                child: Text('Refresh'),
                style: TextButton.styleFrom(
                  primary: accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
