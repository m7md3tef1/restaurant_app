import 'package:dio/dio.dart';
import '../../dialoges/toast.dart';

class Api {
  String baseUrl = 'https://api.escuelajs.co/api/v1/';

  Future getHttp({data, authToken,url}) async {
    try {
      var response = await Dio().get(
        baseUrl+url,
        queryParameters: data,
      );
      if (response.statusCode == 200) {
        print('GET REQUEST: baseUrl');
        print(response.data);
        var productsList=response.data;
        print('prooooooooooooooo');
        print(productsList);
        return productsList;
      } else {
        return '';
      }
    } on DioException catch (e) {
      print('error');
      if (e.response!.statusCode == 401) {
        throw Exception(e.response!.data);
      } else {
        print('------------------------');
        print(e.response!.data);
        print(e.error);
        print('------------------------');
        throw Exception(e.response!.data);
      }
    }
  }

  Future<dynamic> postHttp({required url, data}) async {
    try {
      var response = await Dio().post(baseUrl+url,
          data: data,
          // queryParameters: queryParams,
          // options: Options(
          //   headers: {
          //     "auth": authToken,
          //   },
          // )
      );

      if (response.statusCode == 200) {
        print('Success POST REQUEST: $baseUrl$url');
        print(response.data);
        print(response.data);
        print(response.statusCode);
        return response.data;
      }
    } on DioException catch (e) {
      print('Failed POST REQUEST: $baseUrl$url');
      print('------------------------');
      print(e.error);
      print(e.response);
      print('------------------------');
      throw Exception(e.response!.data);
    }
  }

  Future<dynamic> putHttp({required url, required data, authToken}) async {
    try {
      var response = await Dio().patch('$baseUrl$url',
          data: data,
          options: Options(headers: {
            "auth": authToken,
          }));
      if (response.statusCode == 200) {
        print('-----------------------');
        print('success');
        print(response.data);
        return response.data;
      }
    } on DioException catch (e) {
      print('------------------------');
      print('faied');

      print(e.response);
      print(e.response!.data['message']);
      showToast(
          msg: e.response!.data['message'].toString(),
          state: ToastedStates.ERROR);
    }
  }
  Future<dynamic> deleteHttp({required url,  data, authToken}) async {
    try {
      var response = await Dio().delete(baseUrl+url,
          data: data,
          options: Options(headers: {
            "auth": authToken,
          }));
      if (response.statusCode == 200) {
        print('-----------------------');
        print('success');
        print(response.data);
        return response.data;
      }
    } on DioException catch (e) {
      print('------------------------');
      print('faied');
      print('Failed POST REQUEST: $baseUrl$url');
      print(e.error);
      print(e.response);
      print(e.response!.data['message']);
    }
  }
}
