import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_nikah_booking/app.dart';
import 'package:my_nikah_booking/data/repositories/auth_repository.dart';
import 'package:my_nikah_booking/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:my_nikah_booking/logic/blocs/get_user_bloc/get_user_bloc.dart';
import 'package:my_nikah_booking/logic/blocs/register_bloc/register_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();
  final GetUserBloc _getUserBloc = GetUserBloc();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            return AuthBloc(userRepository: userRepository)
              ..add(
                AppStarted(),
              );
          },
        ),
        BlocProvider<RegisterBloc>(
          create: (context) {
            return RegisterBloc(userRepository: userRepository);
          },
        ),
        BlocProvider<GetUserBloc>(create: (context) {
          return _getUserBloc;
        })
      ],
      child: App(userRepository: userRepository),
    ),
  );

  await Future.delayed(
    const Duration(milliseconds: 500),
    () => FlutterNativeSplash.remove(),
  );
}
