import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../../config/ui_icons.dart';
import '../models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

class ProfileSettingsDialog extends StatefulWidget {
  User user;
  VoidCallback onChanged;

  ProfileSettingsDialog({Key key, this.user, this.onChanged}) : super(key: key);

  @override
  _ProfileSettingsDialogState createState() => _ProfileSettingsDialogState();
}

class _ProfileSettingsDialogState extends State<ProfileSettingsDialog> {
  GlobalKey<FormState> _profileSettingsFormKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                titlePadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                title: Row(
                  children: <Widget>[
                    Icon(UiIcons.user_1),
                    SizedBox(width: 10),
                    Text(
                      'Profile Settings',
                      style: Theme.of(context).textTheme.body2,
                    )
                  ],
                ),
                children: <Widget>[
                  Form(
                    key: _profileSettingsFormKey,
                    child: Column(
                      children: <Widget>[
                        new TextFormField(
                          style: TextStyle(color: Theme.of(context).hintColor),
                          keyboardType: TextInputType.text,
                          decoration: getInputDecoration(
                              hintText: 'John', labelText: 'First Name'),
                          initialValue: widget.user.firstName,
                          validator: (input) => input.trim().length < 2
                              ? 'Not a valid first name'
                              : null,
                          onSaved: (input) => widget.user.firstName = input,
                        ),
                        new TextFormField(
                          style: TextStyle(color: Theme.of(context).hintColor),
                          keyboardType: TextInputType.text,
                          decoration: getInputDecoration(
                              hintText: 'Doe', labelText: 'Last Name'),
                          initialValue: widget.user.lastName,
                          validator: (input) => input.trim().length < 2
                              ? 'Not a valid full name'
                              : null,
                          onSaved: (input) => widget.user.lastName = input,
                        ),
                        new TextFormField(
                          style: TextStyle(color: Theme.of(context).hintColor),
                          keyboardType: TextInputType.emailAddress,
                          decoration: getInputDecoration(
                              hintText: 'johndo@gmail.com',
                              labelText: 'Email Address'),
                          initialValue: widget.user.email,
                          validator: (input) =>
                              !input.contains('@') ? 'Not a valid email' : null,
                          onSaved: (input) => widget.user.email = input,
                        ),
                        new TextFormField(
                          style: TextStyle(color: Theme.of(context).hintColor),
                          keyboardType: TextInputType.phone,
                          decoration: getInputDecoration(
                              hintText: '+911234567890',
                              labelText: 'Phone Number'),
                          initialValue: widget.user.phoneNumber,
                          //validator: (input) =>
                          //  !input.contains('') ? 'Not a valid email' : null,
                          onSaved: (input) => widget.user.phoneNumber = input,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      MaterialButton(
                        onPressed: _submit,
                        child: Text(
                          'Save',
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  SizedBox(height: 10),
                ],
              );
            });
      },
      child: Text(
        "Edit",
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }

  InputDecoration getInputDecoration({String hintText, String labelText}) {
    return new InputDecoration(
      hintText: hintText,
      labelText: labelText,
      hintStyle: Theme.of(context).textTheme.body1.merge(
            TextStyle(color: Theme.of(context).focusColor),
          ),
      enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2))),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor)),
      hasFloatingPlaceholder: true,
      labelStyle: Theme.of(context).textTheme.body1.merge(
            TextStyle(color: Theme.of(context).hintColor),
          ),
    );
  }

  void _submit() {
    if (_profileSettingsFormKey.currentState.validate()) {
      _profileSettingsFormKey.currentState.save();
      Navigator.pop(context);
    }
  }
}
