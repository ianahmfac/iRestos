import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../core/constants/enum.dart';
import '../core/data/models/restaurant.dart';
import '../store/review/review_store.dart';
import '../store/user/user_store.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';

class AddReviewForm extends StatefulWidget {
  static const routeName = '/add-review-form';
  final Restaurant restaurant;
  const AddReviewForm({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  _AddReviewFormState createState() => _AddReviewFormState();
}

class _AddReviewFormState extends State<AddReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _reviewStore = getIt<ReviewStore>();
  final _userStore = getIt<UserStore>();

  void _submitForm() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    await _reviewStore.postReview(widget.restaurant.id);
    if (_reviewStore.isComplete) {
      return Navigator.pop(context, true);
    }
    CustomDialog(
      title: 'Failed',
      confirmationText: 'OK',
      subtitle: _reviewStore.message,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Review - ${widget.restaurant.name}'),
        ),
        body: SingleChildScrollView(
          child: _contentBody(),
        ),
      ),
    );
  }

  Widget _contentBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              initialValue: _userStore.currentUser!.name,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              cursorColor: accentColor,
              decoration: InputDecoration(
                labelText: 'Your Name',
              ),
              onSaved: _reviewStore.setName,
              validator: _reviewStore.validateForm,
            ),
            SizedBox(height: 16),
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.newline,
              cursorColor: accentColor,
              maxLines: 5,
              minLines: 2,
              decoration: InputDecoration(
                labelText: 'Review',
              ),
              onSaved: _reviewStore.setReview,
              validator: _reviewStore.validateForm,
            ),
            SizedBox(height: 30),
            CustomButton(
              width: double.infinity * 0.7,
              text: _reviewStore.networkState == NetworkState.Initialize
                  ? 'Submitting...'
                  : 'Submit Review',
              onPressed: _reviewStore.networkState == NetworkState.Initialize
                  ? null
                  : _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
