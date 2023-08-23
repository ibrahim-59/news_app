part of 'general_news_cubit.dart';

sealed class GeneralNewsState extends Equatable {
  const GeneralNewsState();

  @override
  List<Object> get props => [];
}

final class GeneralNewsInitial extends GeneralNewsState {}

final class GeneralNewsLoading extends GeneralNewsState {}

final class GeneralNewsSuccess extends GeneralNewsState {
  final List<Article> news;

  const GeneralNewsSuccess({required this.news});
}

final class GeneralNewsFailure extends GeneralNewsState {
  final String errorMessage;

  const GeneralNewsFailure({required this.errorMessage});
}
