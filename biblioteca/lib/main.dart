// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/app_view.dart';
import 'bloc/book_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
			
      create: (context) => BookBloc(),
      child: MaterialApp(
        title: 'Biblioteca Virtual',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AppView(),
				debugShowCheckedModeBanner: false,
      ),
    );
  }
}

