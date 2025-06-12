// lib/models/book
import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String title;
  final String author;
  final String publishDate;

  const Book({
    required this.title,
    required this.author,
    required this.publishDate,
  });

  @override
  List<Object?> get props => [title, author, publishDate];
}

