import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_movie_app/src/movie_app.dart';

void main() {
  runApp(
    const ProviderScope(child: MovieApp()),
  );
}
