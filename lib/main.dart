import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/profile_screen.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const seedColor = Colors.deepPurple;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, _) {
        return MaterialApp(
          title: 'BentoBio',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light),
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
            appBarTheme: const AppBarTheme(centerTitle: false, scrolledUnderElevation: 0),
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark),
            textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
            appBarTheme: const AppBarTheme(centerTitle: false, scrolledUnderElevation: 0),
          ),
          
          home: const ProfileScreen(),
        );
      },
    );
  }
}
