abstract class AuthEvent {}

class EventLogin extends AuthEvent {
  final String email;
  final String password;
  EventLogin({
    required this.email,
    required this.password,
  });
}

class EventLogout extends AuthEvent {}

class EventCreateUser extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  EventCreateUser({
    required this.email,
    required this.password,
    required this.fullName,
  });
}

class EventGetCurrentUser extends AuthEvent {
  final String firebaseId;
  final String token;
  EventGetCurrentUser({
    required this.firebaseId,
    required this.token,
  });
}
