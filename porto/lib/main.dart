import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatefulWidget {
  const MyPortfolioApp({super.key});

  @override
  State<MyPortfolioApp> createState() => _MyPortfolioAppState();
}

class _MyPortfolioAppState extends State<MyPortfolioApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Mahasiswa',
      debugShowCheckedModeBanner: false,

      // ========= THEME WITH AUTO TEXT COLOR =========
      theme: ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),

        // FIX: TEXT OTOMATIS GANTI WARNA SESUAI TEMA
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData(
            brightness: isDark ? Brightness.dark : Brightness.light,
          ).textTheme,
        ),

        useMaterial3: true,
      ),

      // ========= HOME PAGE =========
      home: WelcomePage(
        toggleTheme: () => setState(() => isDark = !isDark),
        isDark: isDark,
      ),
    );
  }
}
