import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.code), // Simbolo per Github
                onPressed: () =>
                    _launchURL('https://github.com/GiuseppeRandazzo'),
                tooltip: 'GitHub',
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.work), // Simbolo LinkedIn
                onPressed: () =>
                    _launchURL('https://linkedin.com/in/tuo-profilo'),
                tooltip: 'LinkedIn',
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.email),
                onPressed: () => _launchURL('mailto:tua.email@example.com'),
                tooltip: 'Email',
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "© ${DateTime.now().year} Giuseppe Randazzo. Creato con Flutter 💙",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'Impossibile aprire $url';
    }
  }
}
