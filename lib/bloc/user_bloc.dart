import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_trainng_day1/data/model/author.dart';
import 'package:flutter_trainng_day1/data/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo;
  UserBloc(this._userRepo) : super(UserLoadingState()) {
    on<UserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final user = _userRepo.fetchUser();
        emit(UserLoadedState(user));
      } catch (e) {
        print(
          UserErrorState(
            e.toString(),
          ),
        );
      }
    });
  }
}
