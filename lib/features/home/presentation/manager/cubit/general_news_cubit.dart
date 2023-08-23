import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/features/home/data/models/article_model.dart';
import 'package:news/features/home/data/repos/home_repo.dart';
part 'general_news_state.dart';

class GeneralNewsCubit extends Cubit<GeneralNewsState> {
  GeneralNewsCubit(this.homeRepo) : super(GeneralNewsInitial());
  final HomeRepo homeRepo;

  fetchGeneralNews() async {
    emit(GeneralNewsLoading());
    var result = await homeRepo.fetchTopNews();
    result.fold((failure) {
      emit(GeneralNewsFailure(errorMessage: failure.toString()));
    }, (news) {
      emit(GeneralNewsSuccess(news: news));
    });
  }
}
