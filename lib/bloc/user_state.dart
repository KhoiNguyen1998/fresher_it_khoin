part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserPremiumLoaded extends UserState {
  final List<User>? premiumUser;
  UserPremiumLoaded({this.premiumUser});
}

class UserNormalLoaded extends UserState {
  final List<User>? normalUser;

  UserNormalLoaded({this.normalUser});
}

class UserErrorState extends UserState {}
