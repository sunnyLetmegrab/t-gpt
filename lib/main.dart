import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:t_gpt/routes.dart';

import 'core/local_db/db.dart';

late AppDatabase appDatabase;
void main() {
  appDatabase = AppDatabase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent.shade200,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(),
      ).copyWith(),
      onGenerateRoute: AppRoutes.genearateRoute,
      initialRoute: AppRoutes.splash,
      title: "T-GPT",
    );
  }
}
