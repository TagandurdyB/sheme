import 'package:dio/dio.dart';

import '../../../data/datasources/remote/http_vars/cookie_manager.dart';

Dio _dio = Dio();

class DioClient {
  Dio get dio => _dio;

  Options header(Map<String, String> headers) => Options(headers: headers);

  FormData get formData => FormData();
  FormData fromMap(Map<String, dynamic> map) => FormData.fromMap(map);

  Future<MapEntry<String, MultipartFile>> fromPath(
    String fileName,
    String filePath,
  ) async =>
      MapEntry(fileName, await MultipartFile.fromFile(filePath));

  Future<List<MapEntry<String, MultipartFile>>> fromPathAll(
    String fileName,
    List<String> filePaths,
  ) async {
    List<MapEntry<String, MultipartFile>> multiPartfiles = [];
    for (int i = 0; i < filePaths.length; i++) {
      MapEntry<String, MultipartFile> multipartFile =
          await fromPath(fileName, filePaths[i]);

      multiPartfiles.add(multipartFile);
    }
    return multiPartfiles;
  }

  static void initInterceptor() =>
      _dio.interceptors.add(CookieManager.instance);
}
