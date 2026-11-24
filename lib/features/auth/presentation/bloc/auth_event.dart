abstract class AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}

class DemoSignInEvent extends AuthEvent {
  final String? sessionCode;

  DemoSignInEvent({this.sessionCode});
}

class SignOutEvent extends AuthEvent {}
