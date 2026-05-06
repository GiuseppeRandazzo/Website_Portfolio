import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/footer_section.dart';
import '../utils/responsive.dart';

class HomePage extends StatefulWidget {
  final VoidChannel onToggleTheme;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Chiavi per lo scroll automatico
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();

  // Aggiungiamo una chiave che indichi a Flutter qual è "L'inizio" di tutta la pagina
  final GlobalKey columnKey = GlobalKey();

  // Controller per gestire lo scroll in modo forzato ed esatto
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null && columnKey.currentContext != null) {
      // 1. Troviamo il "blocco" su cui hai cliccato
      final RenderBox sectionBox =
          key.currentContext!.findRenderObject() as RenderBox;
      // 2. Troviamo il "blocco" iniziale di tutta la pagina madre
      final RenderBox columnBox =
          columnKey.currentContext!.findRenderObject() as RenderBox;

      // 3. Facciamo calcolare a Flutter la distanza ESATTA in pixel tra l'inizio del sito e la sezione selezionata
      final Offset offset = sectionBox.localToGlobal(
        Offset.zero,
        ancestor: columnBox,
      );

      // 4. Diciamo al Controller della pagina: "Vai matematicamente a quella coordinata in pixel!"
      _scrollController.animateTo(
        offset.dy,
        duration: const Duration(milliseconds: 700),
        curve: Curves
            .easeInOut, // Usato EaseInOut senza rimbalzi per evitare crash fuori limite su Web
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                  TextButton(
                    onPressed: () => _scrollToSection(projectsKey),
                    child: const Text('Progetti'),
                  ),
                  const SizedBox(width: 24),
                  TextButton(
                    onPressed: () => _scrollToSection(skillsKey),
                    child: const Text('Competenze'),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
            IconButton(
              icon: Icon(
                widget.isDarkMode ? Icons.light_mode : Icons.dark_mode_outlined,
              ),
              onPressed: widget.onToggleTheme,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Colleghiamo il controller allo scroll
        child: Column(
          key:
              columnKey, // Assegniamo la chiave madre qui per il calcolo metrico perfetto
          children: [
            const HeroSection(),
            SkillsSection(key: skillsKey),
            ProjectsSection(key: projectsKey),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

typedef VoidChannel = void Function();
