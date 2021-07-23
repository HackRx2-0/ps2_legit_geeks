import '../../config/ui_icons.dart';
import '../../enum/view_state.dart';
import '../../provider/base_view.dart';
import '../../view/login_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool _showPassword = false;
  var _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return BaseView<LogInViewModel>(
      builder: (ctx, model, child) => Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      margin:
                          EdgeInsets.symmetric(vertical: 55, horizontal: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor.withOpacity(0.6),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      margin: EdgeInsets.fromLTRB(20, 85, 20, 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5),
                          Text('Sign Up',
                              style: Theme.of(context).textTheme.headline2),
                          SizedBox(height: 10),
                          new TextFormField(
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'Enter your first name';
                              }
                              return null;
                            },
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.name,
                            controller: model.firstNameController,
                            decoration: new InputDecoration(
                              hintText: 'First Name',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .merge(
                                    TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                UiIcons.user_2,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          new TextFormField(
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'Enter your last name';
                              }
                              return null;
                            },
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.name,
                            controller: model.lastNameController,
                            decoration: new InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .merge(
                                    TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                UiIcons.user_2,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          new TextFormField(
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid) {
                                return "Enter correct email";
                              }
                              return null;
                            },
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.emailAddress,
                            controller: model.emailController,
                            decoration: new InputDecoration(
                              hintText: 'Email',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .merge(
                                    TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                UiIcons.envelope,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          new TextFormField(
                            validator: (value) {
                              final numericRegex = RegExp(
                                  r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
                              if (value.length != 10 ||
                                  !numericRegex.hasMatch(value)) {
                                return "Enter correct Mobile Number";
                              }
                              return null;
                            },
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.number,
                            controller: model.userNameController,
                            decoration: new InputDecoration(
                              hintText: 'Mobile Number',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .merge(
                                    TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                UiIcons.smartphone,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          new TextFormField(
                            validator: (value) {
                              String pattern =
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                              RegExp regExp = new RegExp(pattern);
                              return (regExp.hasMatch(value)
                                  ? null
                                  : "Enter correct password");
                            },
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.text,
                            controller: model.passwordController,
                            obscureText: !_showPassword,
                            decoration: new InputDecoration(
                              hintText: 'Password',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .merge(
                                    TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                UiIcons.padlock_1,
                                color: Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.4),
                                icon: Icon(_showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          new TextFormField(
                            validator: (value) {
                              if (model.passwordController.text != value) {
                                return "Password is different";
                              }
                              return null;
                            },
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.text,
                            obscureText: !_showPassword,
                            decoration: new InputDecoration(
                              hintText: 'Confirm Password',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .merge(
                                    TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                UiIcons.padlock_1,
                                color: Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.4),
                                icon: Icon(_showPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          new TextFormField(
                            validator: (value) {
                              final numericRegex = RegExp(
                                  r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');
                              if (!numericRegex.hasMatch(value)) {
                                return "Wrong Referral Code";
                              }
                              return null;
                            },
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.number,
                            controller: model.referralCodeController,
                            decoration: new InputDecoration(
                              hintText: 'Referral Code (Optional)',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .merge(
                                    TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                UiIcons.users,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          model.state == ViewState.Busy
                              ? CircularProgressIndicator()
                              : FlatButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 70),
                                  onPressed: () {
                                    final isValid =
                                        _formKey.currentState.validate();
                                    if (isValid) {
                                      _formKey.currentState.save();
                                      model.signUp(context);
                                    }
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style:
                                        Theme.of(context).textTheme.title.merge(
                                              TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                  ),
                                  color: Theme.of(context).accentColor,
                                  shape: StadiumBorder(),
                                ),
                          SizedBox(height: 10),
                          // Text(
                          //   'Or using social media',
                          //   style: Theme.of(context).textTheme.body1,
                          // ),
                          // SizedBox(height: 20),
                          // new SocialMediaWidget()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/SignIn');
                },
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.title.merge(
                          TextStyle(color: Theme.of(context).primaryColor),
                        ),
                    children: [
                      TextSpan(text: 'Already have an account ?'),
                      TextSpan(
                          text: ' Sign In',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
