import 'package:flutter/material.dart';

import '../config/theme/styles.dart';
import 'custom_button.dart';
import 'custom_circle_button.dart';

class CustomDialog {
  const CustomDialog({
    required this.title,
    required this.confirmationText,
    this.subtitle,
    this.cancelText,
    this.icon,
  });
  final String title;
  final String? subtitle;
  final String confirmationText;
  final String? cancelText;
  final IconData? icon;

  Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 12),
                  _buildIcon(),
                  _buildTitleText(),
                  SizedBox(height: 16),
                  _buildSubtitleText(),
                  _buildActionButton(context),
                ],
              ),
              _closeButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget _closeButton(BuildContext context) {
    return Positioned(
      right: 0,
      child: CustomCircleButton(
        icon: Icons.close,
        onPressed: () => Navigator.pop(context, false),
        buttonSize: 25,
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: cancelText != null,
          child: Expanded(
            child: CustomButton(
              text: cancelText ?? '',
              onPressed: () => Navigator.pop(context, false),
              height: 40,
              textSize: 12,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: CustomButton(
            text: confirmationText,
            onPressed: () => Navigator.pop(context, true),
            height: 40,
            textSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitleText() {
    return Visibility(
      visible: subtitle != null,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        child: Text(
          subtitle ?? '',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildIcon() {
    return Visibility(
      visible: icon != null,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        child: Icon(
          icon,
          color: accentColor,
          size: 80,
        ),
      ),
    );
  }
}
