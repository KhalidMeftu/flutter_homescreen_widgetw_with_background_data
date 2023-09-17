import 'package:flutter_widgtes_demo/controller/get_all_news_bloc.dart';
import 'package:flutter_widgtes_demo/data/data_source/remote_data_source.dart';
import 'package:flutter_widgtes_demo/data/repository/app_repository.dart';
import 'package:flutter_widgtes_demo/domain/data_source/base_datasource.dart';
import 'package:flutter_widgtes_demo/domain/repository/base_repository.dart';
import 'package:flutter_widgtes_demo/domain/usecases/app_usecases.dart';
import 'package:get_it/get_it.dart';

GetIt sLocator = GetIt.instance;

class AppLocator {
  static Future<void> setupLocator() async {
    sLocator.registerFactory(() => GetAllNewsBloc(sLocator()));
    sLocator.registerLazySingleton(() => AppUseCases(sLocator()));
    sLocator.registerLazySingleton<AppBaseRepository>(() => AppRepository(sLocator()));
    sLocator.registerLazySingleton<BaseRemoteDataSource>(() => AppRemoteDataSource());

  }
}