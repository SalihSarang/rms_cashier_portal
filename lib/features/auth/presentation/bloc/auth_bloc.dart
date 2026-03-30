import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_auth_status.dart';
import '../../domain/usecases/sign_in_cashier.dart';
import '../../domain/usecases/sign_out_cashier.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInCashier _signInCashier;
  final SignOutCashier _signOutCashier;
  final CheckAuthStatus _checkAuthStatus;

  AuthBloc({
    required SignInCashier signInCashier,
    required SignOutCashier signOutCashier,
    required CheckAuthStatus checkAuthStatus,
  }) : _signInCashier = signInCashier,
       _signOutCashier = signOutCashier,
       _checkAuthStatus = checkAuthStatus,
       super(AuthInitial()) {
    on<CheckAuthEvent>(_onCheckAuthEvent);
    on<SignInEvent>(_onSignInEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  Future<void> _onCheckAuthEvent(
    CheckAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(isInitialCheck: true));
    try {
      final user = await _checkAuthStatus();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(isInitialCheck: false));
    try {
      final user = await _signInCashier(event.email, event.password);
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError('Failed to sign in. Please try again.'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutEvent(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(isInitialCheck: false));
    try {
      await _signOutCashier();
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
