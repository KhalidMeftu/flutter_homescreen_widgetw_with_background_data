part of 'get_all_news_bloc.dart';

abstract class GetAllNewsState extends Equatable {
  const GetAllNewsState();
}

class GetAllNewsInitial extends GetAllNewsState {
  @override
  List<Object> get props => [];
}


//news loading
class GettingNews extends GetAllNewsState {
  @override
  List<Object> get props => [];
}
/// news loaded
class NewsLoadedSuccessfully extends GetAllNewsState {
  final NewsModel newsModel;

  const NewsLoadedSuccessfully(this.newsModel);
  @override
  List<Object> get props => [newsModel];
}
/// loading errror
class LoadingError extends GetAllNewsState {
  final String errorMessage;

  const LoadingError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}