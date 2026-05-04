import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    final skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'REST APIs',
      'Git & GitHub',
      'UI/UX Design',
      'Provider/Riverpod',
      'HTML/CSS',
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: 80,
      ),
      color: Theme.of(context).primaryColor.withOpacity(0.05),
      child: Column(
        children: [
          const Text(
            "Le mie Competenze",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ).animate().fade().slideY(),
          const SizedBox(height: 48),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: skills.map((skill) {
              return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      skill,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  )
                  .animate()
                  .fade(
                    delay: Duration(milliseconds: 100 * skills.indexOf(skill)),
                  )
                  .scale();
            }).toList(),
          ),
        ],
      ),
    );
  }
}
