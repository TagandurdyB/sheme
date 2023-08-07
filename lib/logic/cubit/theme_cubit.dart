import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/constants/enums.dart';
import '../../config/constants/words.dart';
import '../../config/services/package/hive_boxes.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState());

  ThemeMode get mode => state.isSystem
      ? ThemeMode.system
      : state.isLight
          ? ThemeMode.light
          : ThemeMode.dark;
//INIT=========================
  void init() {
    _initSystem();
    _initLight();
    _initLang();
  }
//System============================================================

  void _initSystem() {
    bool? read = Boxes.themeSystem;
    if (read != null) {
      emit(state.copyWith(isSystem: read));
    } else {
      changeSystem(true);
    }
  }

  void changeSystem(bool val) {
    emit(state.copyWith(isSystem: val));
    Boxes.putThemeSystem(val);
  }

  void get tongleSystem {
    try {
      changeSystem(!state.isSystem);
    } catch (err) {
      throw ("Error on data Theme Provider tongleSystem:$err");
    }
  }

//Light=============================================================
  void _initLight() {
    bool? read = Boxes.themeLight;
    if (read != null) {
      emit(state.copyWith(isLight: read));
    } else {
      changeLight(true);
    }
  }

  void changeLight(bool val) {
    emit(state.copyWith(isLight: val));
    Boxes.putThemeLight(val);
  }

  void get tongleLight {
    try {
      changeLight(!state.isLight);
    } catch (err) {
      throw ("Error on data Theme Provider tongleMode:$err");
    }
  }

//Language===============================
  void _initLang() => emit(state.copyWith(lang: Boxes.lang));

  void changeLang(Lang val) {
    emit(state.copyWith(lang: val));
    Boxes.putLang(val);
  }

  Words get getWords => Words(state.lang);

//PopUp==================================
  // bool _isLoading = false;
  // bool get isLoding => _isLoading;
  // void changeIsLoading(bool isLoad) {
  //   _isLoading = isLoad;
  // }

  // bool _warningOk = false;
  // bool get warningOk => _warningOk;
  // void changeWarning(bool isWar) {
  //   _warningOk = isWar;
  // }

//==

  static ThemeCubit of(context, {listen = true}) =>
      BlocProvider.of<ThemeCubit>(context, listen: listen);

  static Words words(context) => ThemeCubit.of(context).getWords;
}
