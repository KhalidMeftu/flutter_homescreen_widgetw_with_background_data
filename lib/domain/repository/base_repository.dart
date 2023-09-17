import 'package:either_dart/either.dart';
import 'package:flutter_widgtes_demo/domain/entity/get_all_news.dart';
abstract class AppBaseRepository{
  Future<Either<String,NewsModel>> getAllNews();

}