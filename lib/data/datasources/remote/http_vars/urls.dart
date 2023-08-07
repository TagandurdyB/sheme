// import '../../../models/queries/img_query.dart';
// import '../../../models/queries/video_query.dart';

// import '../../../models/queries/banner_query.dart';
// import '../../../models/queries/post_query.dart';
// import '../../../models/queries/profile_query.dart';

class MyQuery {
  final String query;
  final dynamic value;
  final bool? status;
  MyQuery(this.query, this.value, {this.status});

  MyQuery copyWith({
    String? query,
    dynamic value,
    bool? status,
  }) {
    return MyQuery(
      query ?? this.query,
      value ?? this.value,
      status: status ?? this.status,
    );
  }

  String toQuery() => status ?? value != null ? "$query=$value" : "";

  static String multiQuery(List<MyQuery> queries) {
    if (queries.isNotEmpty) {
      String result = "";
      String char = "?";
      for (int i = 0; i < queries.length; i++) {
        final obj = queries[i];
        if (result.isNotEmpty) char = "&";
        result += obj.copyWith(query: "$char${obj.query}").toQuery();
      }
      return result;
    } else {
      throw "queries can not be empty!!!";
    }
  }
}

class Urls {
  //////////////////////////////////////////////////////////////////////
  // static String ip = "10.15.0.76";
  // static String port = "8081";
  static const domain = "https://beta2.arzan.info";
  static const api = "$domain/api/v1";

  //////////////////////////////////////////////////////////////////////
  static String query(MyQuery obj) =>
      obj.status ?? obj.value != null ? "${obj.query}${obj.value}" : "";

  //////////////////////////////////////////////////////////////////////

  static const register = "$api/account/signup";
  static const login = "$api/account/login";
  static const checkAcaunt = "$api/account/verify/check";
  static const exist = "$api/account/exists"; //phone:"+99365000000"

  //==================================================================

  static const chackRecover = "$api/account/recover/verify/check";
  //phone:"+99365000000"
  static const recover = "$api/account/reset-password";
  //phone:"+99365000000", password:"123123A!a"
  // static Uri recover = Uri.parse("$api/account/verify");//recover:bool
  //==================================================================
  static const locations = "$api/location/list";

  ///////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////////////////////

  ///
  // static String banner(BannerQuery obj) {
  //   return "$api/banner${multiQuery([
  //         MyQuery("page", obj.pageId),
  //         MyQuery("location_id", obj.welayat, status: obj.welayat > 1),
  //         MyQuery("page_category", obj.categId, status: obj.categId > 0),
  //       ])}&platform=2";
  // }
}
