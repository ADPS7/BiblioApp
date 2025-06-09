import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List> searchBooks(String title, String author) async {
    String normalize(String input) {
      const accents = 'áàäâãéèëêíìïîóòöôõúùüûñÁÀÄÂÃÉÈËÊÍÌÏÎÓÒÖÔÕÚÙÜÛÑ';
      const withoutAccents = 'aaaaaeeeeiiiiooooouuuunAAAAAEEEEIIIIOOOOOUUUUN';
      return input.split('').map((char) {
        int index = accents.indexOf(char);
        return index != -1 ? withoutAccents[index] : char;
      }).join();
    }

    String titleQuery = normalize(title).replaceAll(' ', '+').toLowerCase();
    String authorQuery = normalize(author).replaceAll(' ', '+').toLowerCase();

    String baseUrl = 'https://openlibrary.org/search.json?';
    List<String> params = [];
    if (title.isNotEmpty) params.add('title=$titleQuery');
    if (author.isNotEmpty) params.add('author=$authorQuery');

    final url = Uri.parse(baseUrl + params.join('&'));
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return [data['docs'], data['numFound']];
    } else {
      throw Exception('Error HTTP: ${response.statusCode}');
    }
  }

  Future<String> getDescripcion(String workKey) async {
    try {
      final url = Uri.parse('https://openlibrary.org$workKey.json');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final desc = data['description'];
        if (desc is String) return desc;
        if (desc is Map && desc['value'] != null) return desc['value'];
      }
    } catch (_) {}
    return 'No disponible';
  }

  String getCoverUrl(dynamic coverId) {
    if (coverId is int) {
      return 'https://covers.openlibrary.org/b/id/$coverId-M.jpg';
    }
    return 'https://via.placeholder.com/300x450.png?text=Sin+Portada';
  }

  String getAuthors(List<dynamic>? authors) {
    if (authors == null || authors.isEmpty) return 'Autor desconocido';
    return authors.join(', ');
  }
}

