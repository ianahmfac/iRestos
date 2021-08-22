import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../store/auth/auth_store.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/header_text.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = 'sign-up';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _authStore = getIt<AuthStore>();

  void _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    bool complete = await _authStore.signUp();
    if (complete) {
      return Navigator.pop(context, true);
    }
    CustomDialog(
      title: 'Sign In Failed',
      confirmationText: 'OK',
      subtitle: _authStore.message,
      icon: CupertinoIcons.person_badge_minus,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(child: _contentBody()),
    );
  }

  Widget _contentBody() {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HeaderText(
              title: 'Register Account',
              subtitle:
                  'Complete your account details\nto be registed in the app',
            ),
            SizedBox(height: 50),
            _emailTextField(),
            SizedBox(height: 24),
            _nameTextField(),
            SizedBox(height: 24),
            _passwordTextField(),
            SizedBox(height: 50),
            Observer(
              builder: (context) => CustomButton(
                text: _authStore.isLoading ? 'Registering...' : 'Continue',
                onPressed: _authStore.isLoading ? null : _signUp,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'By continuing your confirm that you are agree\nwith Our Term and Condition',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _nameTextField() {
    return TextFormField(
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
      onSaved: _authStore.setName,
      validator: _authStore.validateName,
    );
  }

  TextFormField _passwordTextField() {
    return TextFormField(
      cursorColor: accentColor,
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24),
          child: Icon(
            CupertinoIcons.lock,
            size: 16,
            color: accentColor,
          ),
        ),
      ),
      onSaved: _authStore.setPassword,
      validator: _authStore.validatePassword,
    );
  }

  TextFormField _emailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: accentColor,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 24),
          child: Icon(
            CupertinoIcons.mail,
            size: 16,
            color: accentColor,
          ),
        ),
      ),
      onSaved: _authStore.setEmail,
      validator: _authStore.validateEmail,
    );
  }
}
