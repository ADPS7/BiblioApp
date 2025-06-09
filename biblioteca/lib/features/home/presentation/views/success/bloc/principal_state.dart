part of 'principal_bloc.dart';

abstract class PrincipalState {}

class InitialPrincipalState extends PrincipalState {}

class LoadingPrincipalState extends PrincipalState {}

class SuccessPrincipalState extends PrincipalState {
  final List books;
  final int totalResults;

  SuccessPrincipalState({required this.books, required this.totalResults});
}

class ErrorPrincipalState extends PrincipalState {
  final String message;

  ErrorPrincipalState({required this.message});
}

class EmptyPrincipalState extends PrincipalState {}
