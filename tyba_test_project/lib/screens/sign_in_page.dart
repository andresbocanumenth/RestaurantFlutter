import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyba_test_project/common/Routes/routes.dart';
import 'package:tyba_test_project/common/color_palette.dart';
import 'package:tyba_test_project/common/ui/tyba_textformfield.dart';
import 'package:tyba_test_project/models/user_model.dart';
import 'package:tyba_test_project/providers/user_state_provider.dart';
import 'package:validators/validators.dart' as validator;


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Container(
          child: TestForm()
      ),
    ));
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TybaTextFormField(
            hintText: 'Email',
            isEmail: true,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (String value) {
              email = value;
            },
          ),
          TybaTextFormField(
            hintText: 'Password',
            isPassword: true,
            validator: (String value) {
              if (value.length < 7) {
                return 'Password should be minimum 7 characters';
              }
              _formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              password = value;
            },
          ),
          RaisedButton(
            color: ColorPalette.Secondary,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _signInButtonPressed(context);
              }
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _signInButtonPressed(BuildContext context) {
    UserStateProvider userStateProvider = Provider.of<UserStateProvider>(context, listen: false);
    userStateProvider.userModel = UserModel(firstName: "Andres", lastName: "Bocanumenth", email: "andresb@gmail.com", password: "qwerty");
    Navigator.of(context).pushNamed(Routes.home);
  }
}