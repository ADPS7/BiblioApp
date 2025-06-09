import 'package:equatable/equatable.dart';

abstract class PrincipalState extends Equatable {
  const PrincipalState();

  @override
  List<Object?> get props => [];
}

class InitialPrincipalState extends PrincipalState {}

class LoadingPrincipalState extends PrincipalState {}

class SuccessPrincipalState extends PrincipalState {
  final List<dynamic> books;
  final int totalResults;

  const SuccessPrincipalState({
    required this.books,
    required this.totalResults,
  });

  @override
  List<Object?> get props => [books, totalResults];
}

class EmptyPrincipalState extends PrincipalState {}

class ErrorPrincipalState extends PrincipalState {
  final String message;

  const ErrorPrincipalState({required this.message});

  @override
  List<Object?> get props => [message];
}
