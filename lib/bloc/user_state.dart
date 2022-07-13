part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserLoadingState extends UserState {
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final Stream<List<User>?> user;

  UserLoadedState(this.user);

  List<Object?> get props => [user];
}

class Name {}

class UserErrorState extends UserState {
  final String err;
  UserErrorState(this.err);
  List<Object?> get props => [err];
}
