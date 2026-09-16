import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/simple_icons.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.primary;

    final List<Map<String, dynamic>> skills = [
      {'name': 'Flutter', 'icon': const FaIcon(FontAwesomeIcons.flutter)},
      {'name': 'React Native', 'icon': const FaIcon(FontAwesomeIcons.react)},
      {'name': 'Next.js', 'icon': Iconify(SimpleIcons.nextdotjs, color: iconColor, size: 18)},
      {'name': 'Node.js', 'icon': const FaIcon(FontAwesomeIcons.nodeJs)},
      {'name': 'Bun', 'icon': Iconify(SimpleIcons.bun, color: iconColor, size: 18)},
      {'name': 'HTML / CSS', 'icon': const FaIcon(FontAwesomeIcons.html5)}, 
      {'name': 'JavaScript / TS', 'icon': const FaIcon(FontAwesomeIcons.js)},
      {'name': 'MySQL', 'icon': const FaIcon(FontAwesomeIcons.database)},
      {'name': 'Git / GitHub', 'icon': const FaIcon(FontAwesomeIcons.github)},
      {'name': 'UI/UX Design', 'icon': const FaIcon(FontAwesomeIcons.figma)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Skills',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '${skills.length} Stacks',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 10.0,
          children: skills.map((skill) {
            return Chip(
              avatar: IconTheme(
                data: IconThemeData(
                  color: Theme.of(context).colorScheme.primary,
                  size: 18,
                ),
                child: skill['icon'] as Widget,
              ),
              label: Text(
                skill['name'],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}