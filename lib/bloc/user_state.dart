part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoaded extends UserState {
  final List<User>? user;
  UserLoaded(this.user);
}

class UserErrorState extends UserState {}
