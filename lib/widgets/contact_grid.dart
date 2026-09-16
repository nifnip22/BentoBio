import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactGrid extends StatelessWidget {
  const ContactGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.15,
          children: const [
            _ContactCard(
              iconWidget: Icon(Icons.alternate_email),
              title: 'EMAIL',
              value: 'h.nifnip22@gmail.com',
              url: 'mailto:h.nifnip22@gmail.com',
            ),
            _ContactCard(
              iconWidget: Icon(Icons.phone_outlined),
              title: 'PHONE',
              value: '+62 813-5678-1628',
              url: 'tel:+6281356781628',
            ),
            _ContactCard(
              iconWidget: FaIcon(FontAwesomeIcons.linkedinIn),
              title: 'LINKEDIN',
              value: 'in/hanif-ahmad-18a879303',
              url: 'https://linkedin.com/in/hanif-ahmad-18a879303',
            ),
            _ContactCard(
              iconWidget: FaIcon(FontAwesomeIcons.github),
              title: 'GITHUB',
              value: 'github.com/nifnip22',
              url: 'https://github.com/nifnip22',
            ),
          ],
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final String value;
  final String url;

  const _ContactCard({
    required this.iconWidget,
    required this.title,
    required this.value,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      
      child: InkWell(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            debugPrint('Tidak bisa membuka $url');
          } 
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: IconTheme(
                  data: IconThemeData(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  child: iconWidget,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}