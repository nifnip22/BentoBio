import 'package:flutter/material.dart';
import 'package:project_digital/main.dart';
import 'package:project_digital/widgets/contact_grid.dart';
import 'package:project_digital/widgets/profile_header.dart';
import 'package:project_digital/widgets/skills_section.dart';
import 'package:project_digital/widgets/video_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BentoBio',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (context, currentMode, child) {
              final isDark = currentMode == ThemeMode.dark ||
                  (currentMode == ThemeMode.system &&
                      MediaQuery.of(context).platformBrightness == Brightness.dark);

              return IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode_outlined),
                onPressed: () {
                  themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
                },
              );
            },
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileHeader(),
                SizedBox(height: 32),
  
                SkillsSection(),
                SizedBox(height: 32),
  
                VideoCard(),
                SizedBox(height: 32),
  
                ContactGrid(),
                SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}