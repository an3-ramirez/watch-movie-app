import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/domain/constants/bottom_bar_constants.dart';
import 'package:watch_movie_app/src/domain/providers/app_providers.dart';
import 'package:watch_movie_app/src/ui/global_widgets/bottom_bar.dart';

class RootPage extends ConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: getBarPage(ref),
    );
  }

  Widget getBarPage(WidgetRef ref) {
    return IndexedStack(
      index: ref.watch(activeTabBottomBarProvider.state).state,
      children: List.generate(
        barItems.length,
        (index) => (barItems[index]["page"]),
      ),
    );
  }
}
