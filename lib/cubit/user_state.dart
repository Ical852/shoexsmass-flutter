part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  UserModel user;
  UserSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserAuthSuccess extends UserState {
  UserModel user;
  UserAuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserSigningIn extends UserState {}

class UserSigningInSuccess extends UserState {
  UserModel user;
  UserSigningInSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserSigningUp extends UserState {}

class UserSigningUpSuccess extends UserState {
  UserModel user;
  UserSigningUpSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserFetching extends UserState {}

class UserFetchingSuccess extends UserState {
  UserModel user;
  UserFetchingSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class UserUpdating extends UserState {}

class UserUpdatingSuccess extends UserState {
  UserModel user;
  UserUpdatingSuccess(this.user);

  @override
  List<Object> get props => [user];
}
