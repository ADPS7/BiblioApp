// lib/services/book_api
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class BookApi {
  static const String baseUrl = 'https://openlibrary.org/search.json'; 

Future<List<Book>> searchBooks(String query) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl?q=$query'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final docs = data['docs'] as List;

      return docs.map((item) {
        return Book(
          title: item['title'] ?? 'Sin título',
          author: (item['author_name'] as List?)?.join(', ') ?? 'Autor desconocido',
          publishDate: item['first_publish_year']?.toString() ?? 'Fecha no disponible',
        );
      }).toList();
    } else {
      return [];
    }
  } catch (e) {
    return []; // Para control de exepciones si en algun momento se necesita.
  	}
	}

}

