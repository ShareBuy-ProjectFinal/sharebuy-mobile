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
  EventCreateUser({
    required this.email,
    required this.password,
  });
}

class EventGetCurrentUser extends AuthEvent {
  final String firebaseId;
  EventGetCurrentUser({
    required this.firebaseId,
  });
}
