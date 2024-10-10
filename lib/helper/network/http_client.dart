// ignore_for_file: avoid_print

import 'dart:developer';
import 'dart:io';

import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:share_buy/helper/constant/app_constant.dart';
import 'package:share_buy/utils/help_function.dart';

class FetchClient {
  String get domain {
    return AppConstants.apiUrl;
  }

  static String token = '';

  Dio dio = Dio();

  logRequest() {
    dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    dio.interceptors.add(PrettyDioLogger(
      maxWidth: 1000,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

  Options options() {
    var option = Options(
        headers: {
          // 'x-application-name': 'PMS-APP', // config sau khi  sử dụng
          // 'Authorization': token.isEmpty ? '' : ('Bearer $token')
        },
        followRedirects: false,
        validateStatus: (status) {
          return true;
        });
    return option;
  }

  Future<Response> getData(
      {String? domainApp,
      required String path,
      Map<String, dynamic>? queryParameters}) async {
    if (await HelpFunction.hasInternet()) {
      try {
        logRequest();
        log((domainApp ?? domain) + path);
        Response<dynamic> result = await dio.get((domainApp ?? domain) + path,
            queryParameters: queryParameters, options: options());
        return result;
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: AppConstants.networkMessage,
          requestOptions: RequestOptions());
    }
  }

  Future<Response> postData(
      {String? domainApp, required String path, dynamic params}) async {
    if (await HelpFunction.hasInternet()) {
      try {
        logRequest();
        print("Into here? code: $params");
        print("Path: $path");
        Response<dynamic> result = await dio.post((domainApp ?? domain) + path,
            data: params, options: options());
        print("Into here? result: $result");
        return result;
      } on DioException catch (e) {
        //print("Into errorExption? code: $params");
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: AppConstants.networkMessage,
          requestOptions: RequestOptions());
    }
  }

  Future<Response> putData(
      {String? domainApp, required String path, dynamic params}) async {
    if (await HelpFunction.hasInternet()) {
      try {
        logRequest();
        Response<dynamic> result = await dio.put((domainApp ?? domain) + path,
            data: params, options: options());
        return result;
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: AppConstants.networkMessage,
          requestOptions: RequestOptions());
    }
  }

  Future<Response> patchData(
      {String? domainApp,
      required String path,
      Map<String, dynamic>? params}) async {
    if (await HelpFunction.hasInternet()) {
      try {
        logRequest();
        Response<dynamic> result = await dio.patch((domainApp ?? domain) + path,
            data: params, options: options());
        return result;
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: AppConstants.networkMessage,
          requestOptions: RequestOptions());
    }
  }

  Future<Response> deleteData(
      {String? domainApp,
      required String path,
      Map<String, dynamic>? params}) async {
    if (await HelpFunction.hasInternet()) {
      try {
        logRequest();

        Response<dynamic> result = await dio.delete(
            (domainApp ?? domain) + path,
            data: params,
            options: options());
        return result;
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: AppConstants.networkMessage,
          requestOptions: RequestOptions());
    }
  }

  Future<Response> uploadImage(String url, String fileUrl) async {
    if (await HelpFunction.hasInternet()) {
      try {
        logRequest();
        final binary = File(fileUrl).readAsBytesSync();
        return await dio.put(url,
            data: Stream.fromIterable(binary.map((e) => [e])),
            options: Options(
                headers: {'Content-Length': binary.length},
                followRedirects: false,
                validateStatus: (status) {
                  return true;
                }));
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: AppConstants.networkMessage,
          requestOptions: RequestOptions());
    }
  }

  Future download(String url, String savePath) async {
    if (await HelpFunction.hasInternet()) {
      try {
        try {
          Response response = await Dio().get(
            url,
            options: Options(
                responseType: ResponseType.bytes,
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }),
          );
          File file = File(savePath);
          print(file.path);
          var raf = file.openSync(mode: FileMode.write);
          raf.writeFromSync(response.data);
          await raf.close();
        } catch (e) {
          print(e);
        }
      } on DioException catch (e) {
        return e.response ??
            Response(statusCode: -1, requestOptions: RequestOptions());
      }
    } else {
      return Response(
          statusCode: -1,
          statusMessage: AppConstants.networkMessage,
          requestOptions: RequestOptions());
    }
  }
}
