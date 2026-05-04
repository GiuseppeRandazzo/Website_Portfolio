import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/responsive.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    // Esempi di progetti fittizi (sostituiscili con i tuoi reali)
    final projects = [
      {
        'title': 'Flutter E-Commerce',
        'description':
            'Applicazione completa per lo shopping online con carrello, pagamenti e gestione ordini.',
        'tags': ['Flutter', 'Firebase', 'Stripe'],
        'link': 'https://github.com/GiuseppeRandazzo',
      },
      {
        'title': 'Dashboard Analytics',
        'description':
            'Pannello di controllo web per la visualizzazione dei dati aziendali con grafici in tempo reale.',
        'tags': ['Flutter Web', 'REST API', 'Charts'],
        'link': 'https://github.com/GiuseppeRandazzo',
      },
      {
        'title': 'Task Manager App',
        'description':
            'App per la produttività con gestione Kanban, promemoria e notifiche.',
        'tags': ['Dart', 'Provider', 'SQLite'],
        'link': 'https://github.com/GiuseppeRandazzo',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Progetti in Evidenza",
            style: TextStyle(
              fontSize: isMobile ? 32 : 40,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fade().slideY(),
          const SizedBox(height: 16),
          Text(
            "Alcuni dei miei lavori recenti di cui vado fiero.",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1.2 : 1.1,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index], index: index);
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final int index;

  const ProjectCard({super.key, required this.project, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.folder_outlined, size: 40, color: theme.primaryColor),
              IconButton(
                icon: const Icon(Icons.open_in_new),
                onPressed: () async {
                  final url = Uri.parse(project['link']!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                tooltip: 'Visualizza Codice',
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            project['title']!,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              project['description']!,
              style: const TextStyle(color: Colors.grey, height: 1.5),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (project['tags'] as List<String>)
                .map(
                  (tag) => Text(
                    tag,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      color: theme.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ).animate().fade(delay: Duration(milliseconds: 100 * index)).slideY();
  }
}
