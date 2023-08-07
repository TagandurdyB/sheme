import 'enums.dart';

class Words {
  final Lang lang;
  Words(this.lang);
  //Messages========================================================================
  String get avtor => _avtor[lang]!;
  final Map<Lang, String> _avtor = {
    Lang.TM: "Tagandurdy Baýramdurdyýew Mekanowiç",
    Lang.RU: "Tagandurdy Bayramdurdyev Mekanovich",
    Lang.EN: "Tagandurdy Bayramdurdyev Mekanovich",
  };

  static const String undefinedPage = "This page not found!!!";
  static const String tryAgain = "Try again!!!";

  //=====================
  static const String loading = "Please wait!";
  static const String delelteWarning =
      "Are you sure you want to delete this object?";

  static const String disconnect = "Please connect to the Internet!";
}
