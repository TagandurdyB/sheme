import 'package:flutter/material.dart';

import '../../config/constants/rout.dart';
import '../pages/add/page_add_exebition.dart';
import '../pages/home_page.dart';
import '../pages/logo_page.dart';
import '../pages/undefined_page.dart';
// import '../../presentation/pages/undefined_page.dart';
// import '../pages/deleted_list_page.dart';
// import '../pages/deleted_task_page.dart';
// import '../pages/disconnect_page.dart';
// import '../pages/login_page.dart';
// import '../pages/logo_page.dart';
// import '../pages/register_page.dart';
// import 'rout.dart';

class AppRoute {
  //====================================
  static MaterialPageRoute _pageRout(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
  //====================================

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Rout.logo:
        return _pageRout(const LogoPage());
      // case Rout.register:
      //   return _pageRout(RegisterPage());
      // case Rout.login:
      //   return _pageRout(LoginPage());
      case Rout.home:
        return _pageRout(const HomePage());
      case Rout.addExhebition:
        return _pageRout(const PageAddExebition());

      // case Rout.deletedLists:
      //   return _pageRout(DeletedListPage());
      // case Rout.deletedTasks:
      //   return _pageRout(DeletedTaskPage());
      //    case Rout.disconnect:
      //   return _pageRout(PageDisconnect());
      default:
        return _pageRout(const UndefinedPage());
    }
  }

  // static Map<String, Widget Function(dynamic)> pages = {
  //   home: (context) => const HomePage(title: "Home Page"),
  // };
}
