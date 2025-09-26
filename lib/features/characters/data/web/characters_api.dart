import 'package:blocwithomerahmed/constans.dart';
import 'package:dio/dio.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true, // lw 7sl error dy btshlly afhom
      receiveTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 10),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get(allCharactersEndPoint);
      return response.data['results'] as List ;
    } catch (e) {
      // print(e);
      return [];
    }
  }
}

