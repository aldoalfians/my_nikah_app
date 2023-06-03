part of 'get_user_bloc.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserLoaded extends GetUserState {
  final GetUser getUser;
  const GetUserLoaded(this.getUser);

  @override
  List<Object> get props => [getUser];
}

class GetUserFailure extends GetUserState {
  final String? message;
  const GetUserFailure(this.message);
}
