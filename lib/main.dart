import 'package:flutter/material.dart';

import 'screens/app_shell.dart';

void main() {
  runApp(const TicketApp());
}

class TicketApp extends StatelessWidget {
  const TicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My tickets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF24262B),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const AppShell(),
    );
  }
}
