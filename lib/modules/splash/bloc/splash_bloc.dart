import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/network/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository _authRepository;
  SplashBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SplashInitial()) {
    on<CheckIsUserRegisteredEvent>(_checkIsUserRegisteredEvent);
  }

  Future<void> _checkIsUserRegisteredEvent(
      CheckIsUserRegisteredEvent event, Emitter<SplashState> emit) async {
    final user = await _authRepository.checkIsUserLoggedIn();
    if (user !=null) {
      emit(RegisteredState(registerUserData: user));
    } else {
      emit(UnRegisteredState());
    }
  }
}
