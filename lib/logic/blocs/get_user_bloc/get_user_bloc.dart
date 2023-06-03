import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_nikah_booking/data/repositories/get_user_repository.dart';

import 'package:my_nikah_booking/data/models/get_user.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc() : super(GetUserInitial()) {
    final GetUserRepository _getUserRepository = GetUserRepository();
    on<GetDataUser>((event, emit) async {
      try {
        emit(GetUserLoading());
        final getUser = await _getUserRepository.fetchUserData();
        emit(GetUserLoaded(getUser));
      } on NetworkError {
        emit(const GetUserFailure("User Gagal Terhubung"));
      }
    });
  }
}
