import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/routes/routes.dart';
import 'package:watch_movie_app/src/ui/global_widgets/background_image.dart';
import 'package:watch_movie_app/src/ui/global_widgets/custom_input.dart';

import 'package:watch_movie_app/src/ui/global_widgets/round_button.dart';
import 'package:watch_movie_app/src/utils/responsive.dart';
import 'package:watch_movie_app/src/domain/constants/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);

    return SafeArea(
      child: Stack(
        children: [
          const BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: responsive.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Text(
                        'Welcome!',
                        style: textWhite,
                      ),
                    ),
                    _formLogin(context)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _formLogin(context) {
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
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, Routes.WELCOME),
              child: const Icon(
                Icons.close,
                color: Colors.white54,
              ),
            ),
          ),
          CustomInput(placeholder: 'Name', textController: nameCtrl),
          CustomInput(placeholder: 'Password', textController: passCtrl),
          const SizedBox(height: 40),
          RoundButton(
            textBtn: 'Log in',
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.ROOT,
                (_) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
