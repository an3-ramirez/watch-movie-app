import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/core/constants/app_constants.dart';

class RoundButton extends StatelessWidget {
  final String textBtn;
  final double paddingVertical;
  final double paddingHorizontal;
  final Color color;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;

  const RoundButton({
    Key? key,
    required this.textBtn,
    this.color = accentColor,
    this.paddingHorizontal = 20.0,
    this.paddingVertical = 0,
    this.fontWeight = FontWeight.w600,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizontal),
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(
              textBtn,
              style: TextStyle(
                color: primaryColor,
                fontSize: 22,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              //side: const BorderSide(color: CustomColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
