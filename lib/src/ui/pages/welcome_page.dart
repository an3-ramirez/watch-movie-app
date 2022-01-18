import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/routes/routes.dart';
import 'package:watch_movie_app/src/ui/global_widgets/background_image.dart';

import 'package:watch_movie_app/src/ui/global_widgets/round_button.dart';
import 'package:watch_movie_app/src/utils/custom_styles.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: size.height * 0.05),
                      const Text(
                        'Welcome!',
                        style: CustomStyles.textWhite,
                      ),
                      SizedBox(
                        height: size.height * 0.28,
                      ),
                      const RoundButton(
                        textBtn: 'Sign up',
                        paddingHorizontal: 80.0,
                        paddingVertical: 20,
                      ),
                      RoundButton(
                        textBtn: 'Log in',
                        color: Colors.white,
                        paddingHorizontal: 80.0,
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.LOGIN),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Forgot password?',
                        style: CustomStyles.textWhite.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
