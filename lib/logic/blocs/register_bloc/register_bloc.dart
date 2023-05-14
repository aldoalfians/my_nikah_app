import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_nikah_booking/data/repositories/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;

  RegisterBloc({
    required this.userRepository,
  }) : super(RegisterInitial()) {
    on<RegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      try {
        await userRepository.regist(event.email, event.name, event.nik,
            event.password, event.confirmPassword);
        emit(RegisterCompeleted());
      } catch (e) {
        emit(RegisterFailure(error: e.toString()));
      }
    });
  }
}
