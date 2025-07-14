import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

enum AppLocale { en, tr }

class LocaleState {
  final Locale locale;
  LocaleState(this.locale);
}

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState(const Locale('tr')));

  void setLocale(AppLocale appLocale) {
    switch (appLocale) {
      case AppLocale.en:
        emit(LocaleState(const Locale('en')));
        break;
      case AppLocale.tr:
        emit(LocaleState(const Locale('tr')));
        break;
    }
  }

  void toggleLocale() {
    if (state.locale.languageCode == 'en') {
      setLocale(AppLocale.tr);
    } else {
      setLocale(AppLocale.en);
    }
  }
}
