import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/footer_section.dart';
import '../utils/responsive.dart';

class HomePage extends StatelessWidget {
  final VoidChannel onToggleTheme;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'G.',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            if (!isMobile)
              Row(
                children: [
                  TextButton(onPressed: () {}, child: const Text('Progetti')),
                  const SizedBox(width: 24),
                  TextButton(onPressed: () {}, child: const Text('Competenze')),
                  const SizedBox(width: 24),
                ],
              ),
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode_outlined,
              ),
              onPressed: onToggleTheme,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            SkillsSection(),
            ProjectsSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

typedef VoidChannel = void Function();
