
class Formater {
  static String twoDigit(int n) {
    return n.toString().padLeft(2, "0");
  }

  static String calendar(DateTime date) {
    return "${twoDigit(date.day)}.${twoDigit(date.month)}.${date.year}";
  }

  static String colck(DateTime date) {
    return "${twoDigit(date.minute)}:${twoDigit(date.second)}";
  }

  static String rounder(int num) {
    final int length = "$num".length;
    return "${num > 999 ? "${"$num".substring(0, length - 3)},${"$num".substring(length - 3)}" : num}";
  }


  static List<String> tagSeperator(String tags) {
    List<String> tagList = tags.replaceAll("#", " #").split(' ');
    tagList.removeAt(0);
    return tagList;
  }

  static String locations(List<String> locations) {
    String str = "";
    for (var element in locations) {
      final e = welayatCode(element);
      str = "$str $e,";
    }
    return str.substring(0, str.length - 1);
  }

  static String? phone(String phone) {
    if (phone.length > 5) {
      String result = phone;
      if (result.substring(0, 4).toUpperCase() == "TEL:") {
        result = result.substring(4);
      }
      if (result.length == 6) {
        result = "+99365$result";
      }
      if (result.length == 11) {
        result = "+$result";
      }
      if (result[0] == "8") {
        result = "+993${result.substring(1)}";
      } else if (result.substring(0, 4) != "+993") {
        result = "+993$result";
      }
      if (result.length == 12) {
        return result;
      }
    }
    return null;
  }

  static String welayatCode(String wel) {
    switch (wel) {
      case "Aşgabat":
        return "AG";
      case "Balkan":
        return "BN";
      case "Ahal":
        return "AH";
      case "Mary":
        return "MR";
      case "Lebap":
        return "LB";
      case "Daşoguz":
        return "DZ";
      default:
        return "TM";
    }
  }

  static bool searcher(List<String> items, String item) {
    final result = items.where((element) => element == item);
    return result.isNotEmpty;
  }







  static bool hasChar(String str) {
    int length = 0;
    for (int i = 0; i <= 9; i++) {
      if (str.contains("$i")) length++;
    }
    for (int i = 0; i < simbols.length; i++) {
      if (str.contains(simbols[i])) length++;
    }
    final int finalLength = str.length - length;
    return finalLength > 0;
  }

  static bool isUpperCase(String letter) {
    if (!hasChar(letter)) return false;
    return letter == letter.toUpperCase();
  }

  static bool hasUpper(String text) {
    for (int i = 0; i < text.length; i++) {
      if (isUpperCase(text[i])) return true;
    }
    return false;
  }

  static bool isLowerCase(String letter) {
    if (!hasChar(letter)) return false;
    return letter == letter.toLowerCase();
  }

  static bool hasLower(String text) {
    for (int i = 0; i < text.length; i++) {
      if (isLowerCase(text[i])) return true;
    }
    return false;
  }

  static bool hasNum(String text) {
    for (int i = 0; i <= 9; i++) {
      if (text.contains("$i")) return true;
    }
    return false;
  }

  static List simbols = [
    "!",
    "@",
    "#",
    "\$",
    "%",
    "^",
    "&",
    "*",
    "(",
    ")",
    "-",
    "_",
    "+",
    "=",
    " ",
    "/",
    " ",
    "'",
    "\"",
    ".",
    ",",
  ];
  static bool hasSimbol(String text) {
    for (int i = 0; i < simbols.length; i++) {
      if (text.contains(simbols[i])) return true;
    }
    return false;
  }

  static int roleStrToInt(String role) {
    switch (role.toLowerCase()) {
      case "user":
        return 0;
      case "official":
        return 1;
      case "expired":
        return 2;
      default:
        return 3;
    }
  }

  static int modFinder(double price, double discount) {
    if (price > discount && discount > 0) {
      final double mod = (discount * 100 / price);
      if (mod.floor() == 100) {
        return 99;
      } else {
        return 100 - mod.floor();
      }
    }
    return 0;
  }
}

