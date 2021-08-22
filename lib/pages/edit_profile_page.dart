import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../store/user/user_store.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_outline_button.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = '/edit-profile';
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _userStore = getIt<UserStore>();

  void _updateProfile() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    if (_userStore.nameUpdate == _userStore.currentUser!.name) {
      CustomDialog(
        title: 'Failed',
        subtitle:
            'Your update name was equals with your current name. Change name again.',
        confirmationText: 'OK',
      ).show(context);
    } else {
      final confirmed = await CustomDialog(
        title: 'Confirmation',
        subtitle: 'Do you want to update your profile?',
        confirmationText: 'Update',
        cancelText: 'Cancel',
      ).show(context);
      if (confirmed!) {
        bool success = await _userStore.updateUser();
        if (success) {
          return Navigator.pop(context, true);
        }
        CustomDialog(
          title: 'Failed',
          subtitle: _userStore.message,
          confirmationText: 'OK',
        ).show(context);
      }
    }
  }

  void _resetPassword() async {
    final confirmed = await CustomDialog(
      title: 'Reset Your Password',
      confirmationText: 'Reset',
      cancelText: 'Cancel',
      subtitle:
          'Password reset link will be send to your email. Make sure your email is correct',
    ).show(context);
    if (confirmed!) {
      try {
        await _userStore.resetPassword();
        CustomDialog(
          title: 'Success',
          confirmationText: 'OK',
          subtitle:
              'Password reset link was sent to ${_userStore.currentUser!.email}',
        ).show(context);
      } catch (e) {
        CustomDialog(
          title: 'Failed',
          confirmationText: 'OK',
          subtitle: _userStore.message,
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _nameTextField(),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlineButton(
                        text: 'Reset Password',
                        onPressed:
                            _userStore.updateLoading ? null : _resetPassword,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CustomButton(
                        text: _userStore.updateLoading
                            ? 'Updating...'
                            : 'Update Profile',
                        onPressed:
                            _userStore.updateLoading ? null : _updateProfile,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _nameTextField() {
    return TextFormField(
      initialValue: _userStore.currentUser?.name,
      cursorColor: accentColor,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: 'Name',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24),
          child: Icon(
            CupertinoIcons.person,
            size: 16,
            color: accentColor,
          ),
        ),
      ),
      onSaved: _userStore.setName,
      validator: _userStore.validateName,
    );
  }
}
