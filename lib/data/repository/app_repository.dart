import 'package:either_dart/src/either.dart';
import 'package:flutter_widgtes_demo/domain/data_source/base_datasource.dart';
import 'package:flutter_widgtes_demo/domain/entity/get_all_news.dart';
import 'package:flutter_widgtes_demo/domain/repository/base_repository.dart';

class AppRepository implements  AppBaseRepository{
  final BaseRemoteDataSource baseremoteDataSource;

  AppRepository(this.baseremoteDataSource);
  @override
  Future<Either<String, NewsModel>> getAllNews() async {
    final result = await baseremoteDataSource.getAllNews();
    return result;
  }



}