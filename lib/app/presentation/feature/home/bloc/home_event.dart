part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeEventLoad extends HomeEvent {}

class HomeEventRefresh extends HomeEvent {}

class HomeEventLoadMore extends HomeEvent {}

class HomeEventSearch extends HomeEvent {
  final String query;

  HomeEventSearch(this.query);
}
