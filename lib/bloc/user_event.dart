part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

// class UserFetcher extends UserEvent {}

class UserPremiumFetcherEvent extends UserEvent {}

class UserNormalFetcherEvent extends UserEvent {}
