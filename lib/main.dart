import 'package:cruv_submission/Screens/seats_grid.dart';
import 'package:cruv_submission/provider/selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SelectedProvider()),
      ],
      child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SeatsGrid()
      ),
    );
  }
}


