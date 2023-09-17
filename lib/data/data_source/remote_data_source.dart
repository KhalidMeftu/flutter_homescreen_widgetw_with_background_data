import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:flutter_widgtes_demo/const/services.dart';
import 'package:flutter_widgtes_demo/domain/data_source/base_datasource.dart';
import 'package:flutter_widgtes_demo/domain/entity/get_all_news.dart';
import 'package:flutter_widgtes_demo/widget/home_screen.dart';

class AppRemoteDataSource implements BaseRemoteDataSource {
  @override
  Future<Either<String, NewsModel>> getAllNews() async {
    // TODO: implement getAllNews

    try {
      final dio = Dio();

      var response = await dio.get(AppServices.baseUrl + AppServices.newsUrl);

      if (response.statusCode == 200) {
        final data2 = NewsModel.fromJson(response.data);
        print('Updated');
        updateHeadline(data2.data[0]);
        return Right(data2);
      } else {
        return Left(response.data['data']);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          return Left(e.response!.statusMessage!);
        } else {
          return Left(e.message!);
        }
      }
      return (Left(e.toString()));
    }
  }
}
Future<Either<String, NewsModel>> getAllNewsBg() async {
  // TODO: implement getAllNews

  try {
    final dio = Dio();

    var response = await dio.get(AppServices.baseUrl + AppServices.newsUrl);

    if (response.statusCode == 200) {
      final data2 = NewsModel.fromJson(response.data);

      return Right(data2);
    } else {
      return Left(response.data['data']);
    }
  } catch (e) {
    if (e is DioException) {
      if (e.response != null) {
        return Left(e.response!.statusMessage!);
      } else {
        return Left(e.message!);
      }
    }
    return (Left(e.toString()));
  }
}