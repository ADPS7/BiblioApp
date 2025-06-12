// lib/bloc/book_state
import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

class SearchBooks extends BookEvent {
  final String query;

  const SearchBooks({required this.query});

  @override
  List<Object> get props => [query];
}

class LoadMoreBooks extends BookEvent {}

class GotoHome extends BookEvent {}

