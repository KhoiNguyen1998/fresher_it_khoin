import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_trainng_day1/data/model/author.dart';
import 'package:flutter_trainng_day1/repository/api_provider.dart';
import 'package:flutter_trainng_day1/repository/user_repo.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserProvider _userProvider;

  UserBloc(this._userProvider) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserNormalFetcherEvent) {
        emit(UserLoadingState());
        List<User>? user = await _userProvider.fetchNormalUser();
        if (user == null) {
          emit(UserErrorState());
        } else {
          emit(UserNormalLoaded(normalUser: user));
        }
      } else if (event is UserPremiumFetcherEvent) {
        emit(UserLoadingState());
        List<User>? preUser = await _userProvider.fetchPremiumUser();
        if (preUser == null) {
          emit(UserErrorState());
        } else {
          emit(UserPremiumLoaded(premiumUser: preUser));
        }
      }
      // if (event is UserLoadingState) {
      //   emit(UserLoadingState());
      //   List<User>? mList = await _apirepository.fetchListNormalUser();
      //   if (mList == null) {
      //     emit(UserErrorState());
      //   } else {
      //     emit(UserNormalLoaded(mList));
      //   }
      // }
      // try {
      //   emit(UserLoadingState());
      //   List<User>? mList = await _apirepository.fetchListNormalUser();
      //   emit(UserNormalLoaded(mList));
      // } on NewWorkErr {
      //   emit(UserErrorState());
      // }
    });
    // on<UserPremiumFetcher>((event, emit) async {
    //   try {
    //     emit(UserLoadingState());
    //     List<User>? mList = await _apirepository.fetchListPremiumUser();
    //     emit(UserPremiumLoaded(mList));
    //   } on NewWorkErr {
    //     emit(UserErrorState());
    //   }
    // });
  }
}
