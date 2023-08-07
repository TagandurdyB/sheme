// ignore_for_file: deprecated_member_use

// import 'package:telephony/telephony.dart';
import 'package:url_launcher/url_launcher.dart';

import '../funcs/formater.dart';

class LauncherService {
  static Future<void> browser(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      // final Uri uri = Uri(scheme: "http", host: url);
      if (await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        throw "Can not Launch Browser!!!";
      }
    } catch (err) {
      throw "Error on  LauncherService Browser err:$err";
    }
  }

  static Future<void> email(String email) async {
    try {
      if (await canLaunch("mailto:$email")) {
        await launch("mailto:$email");
      } else {
        throw "Can not Launch email!!!";
      }
    } catch (err) {
      throw "Error on  LauncherService email err:$err";
    }
  }

  static Future<bool> phone(String num) async {
    final String phone = Formater.phone(num) ?? "+993";
    return await launch("tel://$phone");
  }

  static Future<bool> sms(String num, String massage) async {
    // if (Platform.isAndroid) {
    //   //FOR Android
    //   url = 'sms:+6000000000?body=message';
    //   await launch(url);
    // } else if (Platform.isIOS) {
    //   //FOR IOS
    //   url = 'sms:+6000000000&body=message';
    // }
    final String url = 'sms$num:?body=$massage';
    return await launch(url);
  }

  static Future<void> sendSMS(String phoneNumber, String message) async {
    String url = 'sms:$phoneNumber?body=${Uri.encodeQueryComponent(message)}';

    try {
      await launch(url);
    } catch (err) {
      throw 'Could not launch SMS intent error : $err';
    }
    // final Telephony telephony = Telephony.instance;
    // telephony.sendSms(to: phoneNumber, message: message);
  }
}
