part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {} // Событие входа
class LogoutRequested extends AuthEvent {} // Событие выхода