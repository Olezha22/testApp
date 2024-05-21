import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LocalizationCubit extends Cubit<Locale> {
  LocalizationCubit() : super(const Locale('en'));

  void setLocale(Locale locale) => emit(locale);
}
