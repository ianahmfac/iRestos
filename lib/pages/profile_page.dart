import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../core/constants/enum.dart';
import '../store/auth/auth_store.dart';
import '../store/scheduling/scheduling_store.dart';
import '../store/user/user_store.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/menu_tile.dart';
import 'edit_profile_page.dart';
import 'sign_in_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _schedulingStore = getIt<SchedulingStore>();
  final _userStore = getIt<UserStore>();
  @override
  Widget build(BuildContext context) {
    _schedulingStore.fetchScheduling();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: SingleChildScrollView(
        child: _contentBody(context),
      ),
    );
  }

  Widget _contentBody(BuildContext context) {
    return Column(
      children: [
        _buildHeaderProfile(context),
        SizedBox(height: 30),
        MenuTile(
          title: 'Edit Profile',
          icon: CupertinoIcons.pencil_circle,
          onPressed: () =>
              Navigator.pushNamed(context, EditProfilePage.routeName).then(
            (value) {
              if (value == true) {
                _userStore.fetchUserLogin();
              }
            },
          ),
        ),
        Observer(
          builder: (context) => MenuTile(
            title: 'Daily Notification',
            subtitle: _schedulingStore.subtitle,
            icon: CupertinoIcons.bell,
            onPressed: null,
            trailingWidget: Switch.adaptive(
              activeColor: accentColor,
              value: _schedulingStore.isScheduled,
              onChanged: (value) => _schedulingStore.setNotification(value),
            ),
          ),
        ),
        MenuTile(
          title: 'Sign Out',
          icon: Icons.logout,
          onPressed: () async {
            final confirmed = await CustomDialog(
              title: 'Confirm Sign Out',
              subtitle: 'Do you want to sign out from this account?',
              confirmationText: 'Sign Out',
              cancelText: 'Cancel',
              icon: Icons.logout,
            ).show(context);
            if (confirmed!) {
              getIt<AuthStore>().signOut();
              Navigator.pushReplacementNamed(context, SignInPage.routeName);
            }
          },
        ),
      ],
    );
  }

  Widget _buildHeaderProfile(BuildContext context) {
    return Observer(builder: (context) {
      switch (_userStore.networkState) {
        case NetworkState.Initialize:
          return Container(
            height: 100,
            width: double.infinity,
            child: Center(child: CupertinoActivityIndicator()),
          );
        case NetworkState.Loaded:
          return Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 16,
              left: 50,
              right: 50,
            ),
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.person_crop_circle_fill,
                  size: 100,
                  color: accentColor,
                ),
                SizedBox(height: 16),
                FittedBox(
                  child: Text(
                    _userStore.currentUser?.name ?? '',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                FittedBox(
                  child: Text(
                    _userStore.currentUser?.email ?? '',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        case NetworkState.Error:
          return Container(
            height: 100,
            width: double.infinity,
            child: Center(child: Text(_userStore.message)),
          );
      }
    });
  }
}
