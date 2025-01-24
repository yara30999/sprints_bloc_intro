import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeData.light())) {
    on<ToggleTheme>((event, emit) {
      final isDark = state.themeData == ThemeData.dark();
      emit(ThemeState(isDark ? ThemeData.light() : ThemeData.dark()));
    });
  }
}
