import 'package:dio/dio.dart';
import 'package:store_app/core/exceptions/auth_exception.dart';
import 'package:store_app/core/interceptor.dart';
import 'package:store_app/data/model/user/user_model.dart';

import '../data/interfaces/serializable.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.100.139:8888/api/v1',
      validateStatus: (status) => true,
    ),
  )..interceptors.add(AuthInterceptor());

  Future<T> genericGetRequest<T>(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    var response = await dio.get(path, queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data as T;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  Future<T> genericPostRequest<T>(
    String path, {
    required IJsonSerializable data,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await dio.post(
      path,
      data: data.toJson(),
      queryParameters: queryParams,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data as T;
    } else {
      throw Exception(response.data);
    }
  }

  Future<bool> genericDeleteRequest(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await dio.delete(path, queryParameters: queryParams);
    if (response.statusCode == 200 || response.statusCode == 204) {
      return true;
    } else {
      throw Exception(response.data);
    }
  }

  Future<bool> genericPatchRequest(
      String path, {
        Map<String, dynamic>? queryParams,
        Map<String, dynamic>? data,
      }) async {
    final response = await dio.patch(path, queryParameters: queryParams, data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception(response.data);
    }
  }

  Future<bool> genericPostRequestV2(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    final response = await dio.post(path, data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> login(String email, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": email, "password": password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(
        message: "login qilib bo'lmadi, xullasi nimadur noto'g'ri ketgan.",
      );
    }
  }

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post('/auth/register', data: model.toJson());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
