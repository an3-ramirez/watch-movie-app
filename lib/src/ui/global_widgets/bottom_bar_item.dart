import 'package:flutter/material.dart';
import 'package:watch_movie_app/src/domain/constants/app_constants.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon, this.title,
      {this.onTap,
      this.color = Colors.black,
      this.activeColor = accentColor,
      this.isActive = false,
      this.isNotified = false});
  final IconData icon;
  final String title;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: [
                Icon(icon, color: isActive ? activeColor : color, size: 23),
                Text(
                  title,
                  style: TextStyle(color: isActive ? activeColor : color),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
