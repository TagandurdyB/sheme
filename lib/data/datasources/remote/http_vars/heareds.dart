import '../../../../config/services/package/hive_boxes.dart';

class Header {
  static Map<String, String> myHeader({
    bool isFormData = false,
  }) {
    final token = Boxes.token;
    final cookie = Boxes.cookie;
    Map<String, String> result = {
      'Content-Type': isFormData ? 'multipart/form-data' : 'application/json'
    };
    if (token != null) {
      result.addAll({'Authorization': "Bearer $token"});
    }
    if (cookie != null) {
      result.addAll({'Cookie': cookie});
    }
    return result;
  }
}
