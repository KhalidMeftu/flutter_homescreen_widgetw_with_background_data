import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_widgtes_demo/domain/entity/get_all_news.dart';
import 'package:flutter_widgtes_demo/domain/usecases/app_usecases.dart';

part 'get_all_news_event.dart';

part 'get_all_news_state.dart';

class GetAllNewsBloc extends Bloc<GetAllNewsEvent, GetAllNewsState> {
  final AppUseCases getUseCase;

  GetAllNewsBloc(this.getUseCase) : super(GetAllNewsInitial()) {
    on<GetAllNews>((event, emit) async {
      // TODO: implement event handler
      emit(GettingNews());
      final result = await getUseCase.excuteLoadNews();
      result.fold((left) => emit(LoadingError(left)),
          (right) => emit(NewsLoadedSuccessfully(right)));
    });
  }
}
