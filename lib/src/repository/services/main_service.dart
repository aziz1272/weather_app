
import 'package:http/http.dart';
import 'package:weather_app/src/repository/constants/api_constants.dart';

class API {
  Map<String, String> headers({String? token, String? lang}) {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    if (lang != null) {
      headers['Accept-Language'] = lang;
    }
    return headers;
  }

  Future<Response> GET({
    required String path,
    String? token,
    String? lang,
    Map<String, dynamic>? params,
  }) async {
    var url = Uri.http(Api.base, path, params);
    Uri? newUrl;
    if (params != null) {
      newUrl = url.replace(queryParameters: params);
    } else {
      newUrl = url;
    }
    final response = await get(
      url,
      headers: headers(token: token, lang: lang),
    );
    return response;
  }

  Future<Response> POST({
    required String path,
    String? body,
    String? token,
  }) async {
    var url = Uri.http(Api.base, path);
    final response = await post(
      url,
      headers: headers(token: token),
      body: body,
    );
    return response;
  }

  Future<Response> PUT({
    required String path,
    String? body,
    String? token,
  }) async {
    var url = Uri.http(Api.base, path);
    final response = await put(
      url,
      headers: headers(token: token),
      body: body,
    );
    return response;
  }

  Future<Response> DELETE({
    required String path,
    String? body,
    String? token,
  }) async {
    var url = Uri.http(Api.base, path);
    final response = await delete(
      url,
      headers: headers(token: token),
      body: body,
    );
    return response;
  }
}