import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/ui/global_widgets/background_image.dart';
import 'package:watch_movie_app/src/ui/global_widgets/custom_input.dart';

import 'package:watch_movie_app/src/ui/global_widgets/round_button.dart';
import 'package:watch_movie_app/src/utils/custom_styles.dart';

class LoginPage extends StatelessWidget {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          'Welcome!',
                          style: CustomStyles.textWhite,
                        ),
                      ),
                      _formLogin()
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

  Widget _formLogin() {
    final nameCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Container(
      height: 420,
      width: double.infinity,
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.close,
              color: Colors.white54,
            ),
          ),
          CustomInput(placeholder: 'Name', textController: nameCtrl),
          CustomInput(placeholder: 'Password', textController: passCtrl),
          const SizedBox(height: 40),
          RoundButton(textBtn: 'Log in', color: Colors.white)
        ],
      ),
    );
  }
}
