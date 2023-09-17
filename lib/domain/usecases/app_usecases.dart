import 'package:either_dart/either.dart';
import 'package:flutter_widgtes_demo/domain/entity/get_all_news.dart';
import 'package:flutter_widgtes_demo/domain/repository/base_repository.dart';

class AppUseCases{
  final AppBaseRepository _appBaseRepository;

  AppUseCases(this._appBaseRepository);

  Future<Either<String,NewsModel>> excuteLoadNews() async{
    return await _appBaseRepository.getAllNews();
  }

}