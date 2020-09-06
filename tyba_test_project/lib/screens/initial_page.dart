import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyba_test_project/common/Routes/routes.dart';
import 'package:tyba_test_project/common/color_palette.dart';
import 'package:tyba_test_project/common/tyba_text_styles.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          color: ColorPalette.Primary,
          width: width,
          padding: EdgeInsets.only(top: 50),
          child: Stack(
            children: [
              Center(
                child: Text(
                  "Tyba Test App",
                  style: TybaTextStyles.WhiteMediumBoldTextStyle.copyWith(
                      fontSize: TybaTextStyles.BigTextSize),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: width,
                  color: Colors.white,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            _onLoginPressed(context);
                          },
                          color: Colors.white,
                          child: Text(
                            "Sign In",
                            style: TybaTextStyles.BlackMediumBoldTextStyle,
                          ),
                          shape: const StadiumBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            _onSignUpPressed(context);
                          },
                          color: Colors.black,
                          child: Text(
                            "Sign Up",
                            style: TybaTextStyles.WhiteMediumBoldTextStyle,
                          ),
                          shape: const StadiumBorder(
                              side: BorderSide(width: 2, color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  void _onLoginPressed(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.signIn);
  }

  void _onSignUpPressed(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.signUp);
  }
}
