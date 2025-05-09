part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {} // Начальное состояние
class AuthLoading extends AuthState {} // Загрузка
class AuthAuthenticated extends AuthState {} // Успешная авторизация
class AuthUnauthenticated extends AuthState {} // Пользователь вышел
class AuthError extends AuthState { // Ошибка
  final String message;
  AuthError(this.message);
}