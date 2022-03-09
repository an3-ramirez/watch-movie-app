import 'package:flutter_riverpod/flutter_riverpod.dart';

// Maneja el estado de la tab active de la barra de navegacion inferior
final activeTabBottomBarProvider = StateProvider.autoDispose<int>((_) => 0);
