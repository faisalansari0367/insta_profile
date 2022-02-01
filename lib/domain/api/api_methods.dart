import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:insta_profile/domain/exceptions/custom_exception.dart';

import 'api_config.dart';

class ApiMethods {
  static dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response;

        return responseJson;
      case 400:
        final map = jsonDecode(response.body);
        throw BadRequestException(map['message'].toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }

  static Future<Response> myPost(
    String url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final uri = '${ApiConfig.domain}$url';
    // await compute();
    final response = await post(
      Uri.parse(uri),
      headers: headers,
      encoding: encoding,
      body: body,
    );
    log('url: ${uri.toString()}');
    final encoder = const JsonEncoder.withIndent('   ').convert(jsonDecode(response.body));
    log('body: $encoder');
    return _response(response);
  }

  static Future<Response> myGet(
    String url, {
    Map<String, String>? headers,
    Encoding? encoding,
  }) async {
    try {
      final uri = '${ApiConfig.domain}$url';
      final encodeFull = Uri.encodeFull(uri);
      final response = await get(Uri.parse(encodeFull), headers: headers);
      log('url: ${uri.toString()}');
      log('response: ${response.statusCode}');
      return _response(response);
    } on SocketException catch (_) {
      throw FetchDataException(
        'No internet connection',
      );
    }
  }
}
