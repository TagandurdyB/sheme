import 'package:dio/dio.dart';
import '../../../../config/services/package/hive_boxes.dart';
import 'heareds.dart';

class CookieManager extends Interceptor {
  static final CookieManager _instance = CookieManager._internal();
  static CookieManager get instance => _instance;
  CookieManager._internal();

  String? _cookie = Boxes.cookie;

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == 200) {
      final cookie = response.headers.map["set-cookie"];
      if (cookie != null) {
        print("Save cookie:=$cookie");
        _saveCookie(cookie[0]);
      }
    } else {
      _clearCookie();
    }
    super.onResponse(response, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // print("token:=$_token");
    // print("cookie:=$_cookie");
    // if (_token != null) {
    //   options.headers = Header.bearer(_token!);
    // } else {
    //   options.headers = Header.contentJson;
    // }
    // options.headers["Cookie"] = _cookie;
    options.headers = Header.myHeader();
    // print("request.header:=${options.headers}");
    super.onRequest(options, handler);
  }

  void _saveCookie(String newCookie) {
    if (_cookie != newCookie) {
      _cookie = newCookie;
      Boxes.putCookie(_cookie);
    }
  }

  void _clearCookie() {
    _cookie = null;
    Boxes.putCookie(_cookie);
  }
}
