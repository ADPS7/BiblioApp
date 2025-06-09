import 'package:flutter/material.dart';
import '../../../../../core/services/http_service.dart';

class ResultsScreen extends StatefulWidget {
  final List books;
  final int totalResults;

  const ResultsScreen({Key? key, required this.books, required this.totalResults}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final _http = HttpService();

  late List displayedBooks;
  int itemsPerPage = 20;
  late int endIndex;

  @override
  void initState() {
    super.initState();
    endIndex = itemsPerPage;
    displayedBooks = widget.books.sublist(0, endIndex.clamp(0, widget.books.length));
  }

  void loadMore() {
    if (endIndex >= widget.books.length) return;
    int nextEnd = (endIndex + itemsPerPage).clamp(0, widget.books.length);
    setState(() {
      displayedBooks.addAll(widget.books.sublist(endIndex, nextEnd));
      endIndex = nextEnd;
    });
  }

  Future<void> _showDescriptionDialog(String workKey, String title) async {
    try {
      final description = await _http.getDescripcion(workKey);
      if (mounted) {
        _mostrarDialogo(description, title);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar descripción: $e')),
        );
      }
    }
  }

  void _mostrarDialogo(String description, String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Descripción: (${title})"),
        content: SingleChildScrollView(
          child: Text(description),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
						style: TextButton.styleFrom(
								backgroundColor: Colors.blueGrey,
								foregroundColor: Colors.white,
						) ,
            child: Text("Cerrar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultados')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Mostrando ${displayedBooks.length} de ${widget.totalResults} resultados.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedBooks.length + 1,
              itemBuilder: (context, i) {
                if (i < displayedBooks.length) {
                  var book = displayedBooks[i];
                  String title = book['title'] ?? 'Título no disponible';
                  String author = _http.getAuthors(book['author_name']);
                  int? coverId = book['cover_i'];
                  String workKey = book['key'];

                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          _http.getCoverUrl(coverId),
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Center(child: Icon(Icons.error)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nombre: ${title}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              Text("Autor: ${author}", style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: ElevatedButton.icon(
                            onPressed: () => _showDescriptionDialog(workKey, title),
                            icon: Icon(Icons.description),
                            label: Text('Ver Descripción'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Visibility(
                    visible: endIndex < widget.books.length,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: loadMore,
                          child: Text('Cargar más'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
