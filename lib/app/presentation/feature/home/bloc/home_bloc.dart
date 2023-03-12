import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:providers_latihan/app/data/model/user_model.dart';

import '../../../../domain/usecase/get_user_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // usecase
  final _usecase = GetIt.I.get<GetUserUseCase>();

  HomeBloc() : super(HomeInitial()) {
    on<HomeEventLoad>((event, emit) async {
      emit(HomeLoading());
      try {
        var result = await _usecase.call();
        emit(HomeLoaded(result));
      } catch (e) {
        emit(HomeError("Error : ${e.toString()}"));
      }
    });
  }
}
