import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/domain/constants/app_constants.dart';
import 'package:watch_movie_app/src/domain/constants/bottom_bar_constants.dart';
import 'package:watch_movie_app/src/domain/constants/colors_constants.dart';
import 'package:watch_movie_app/src/ui/global_widgets/bottom_bar_item.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';

class BottomBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int activeTab = ref.watch(activeTabBottomBarProvider.state).state;

    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
        color: blackColorBottonBar,
        boxShadow: [
          BoxShadow(
            color: blackColorBottonBar.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 25,
          right: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            barItems.length,
            (index) => BottomBarItem(
              barItems[index]["icon"],
              barItems[index]["title"],
              isActive: activeTab == index,
              activeColor: accentColor,
              color: lightColor,
              onTap: () {
                onPageChanged(index, ref);
              },
            ),
          ),
        ),
      ),
    );
  }

  void onPageChanged(int index, WidgetRef ref) {
    ref.read(activeTabBottomBarProvider.state).state = index;
  }
}
