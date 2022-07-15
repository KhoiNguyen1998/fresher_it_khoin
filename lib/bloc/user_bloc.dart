import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_trainng_day1/data/model/author.dart';
import 'package:flutter_trainng_day1/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final ApiRepository _apirepository = ApiRepository();
    on<UserEvent>((event, emit) async {
      try {
        emit(UserLoadingState());
        final mList = await _apirepository.fetchUserList();
        emit(UserLoaded(mList));
        emit(UserErrorState());
      } on NewWorkErr {
        emit(UserErrorState());
      }
    });
  }
}
