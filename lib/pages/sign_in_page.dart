import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../store/auth/auth_store.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_outline_button.dart';
import '../widgets/header_text.dart';
import 'navigation_page.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  static const routeName = 'sign-in';
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _authStore = getIt<AuthStore>();

  void _goToSignUpPage() {
    Navigator.pushNamed(context, SignUpPage.routeName).then((value) {
      if (value == true) {
        Navigator.pushReplacementNamed(context, NavigationPage.routeName);
      }
    });
  }

  void _goToHomePage() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final complete = await _authStore.signIn();
    if (complete) {
      Navigator.pushReplacementNamed(context, NavigationPage.routeName);
      return;
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
        title: const Text('Sign In'),
      ),
      body: SingleChildScrollView(child: _contentBody()),
    );
  }

  Widget _contentBody() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          30,
          50,
          30,
          30,
        ),
        width: double.infinity,
        child: Observer(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderText(
                title: 'Welcome Back',
                subtitle:
                    'Sign in with your email and password\nor sign up for new account',
              ),
              SizedBox(height: 50),
              _emailTextField(),
              SizedBox(height: 24),
              _passwordTextField(),
              SizedBox(height: 50),
              CustomButton(
                text: _authStore.isLoading ? 'Signing In...' : 'Continue',
                onPressed: _authStore.isLoading ? null : _goToHomePage,
              ),
              SizedBox(height: 16),
              Text(
                '- Don\'t have an account? -',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
              CustomOutlineButton(
                text: 'Sign Up',
                onPressed: _authStore.isLoading ? null : _goToSignUpPage,
              ),
            ],
          ),
        ),
      ),
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
