import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/constants/tags.dart';
import 'config/services/funcs/my_orientation.dart';
import 'injector.dart';
import 'logic/cubit/theme_cubit.dart';
import 'presentation/routes/app_route.dart';
import 'presentation/theme/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Tags.hiveBase);
  MyOrientation.systemUiOverlayStyle();
  runApp(const Injector(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exebition',
      themeMode: ThemeCubit.of(context).mode,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
