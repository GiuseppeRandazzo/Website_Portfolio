import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final bgColor = theme
        .scaffoldBackgroundColor; // Prende il colore di sfondo della pagina (bianco)

    return Stack(
      children: [
        // --- LIVELLO INFERIORE: FOTO COME SFONDO NELLA METÀ DESTRA ---
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          // La foto inizierà dal 40% dello schermo (per permettere alla sfumatura di fare da transizione col bianco)
          left: isMobile ? 0 : MediaQuery.of(context).size.width * 0.4,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/piano_americano.jpg'),
                // fit: BoxFit.cover fa sì che si allarghi bene fino ai bordi senza riquadri
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            // Un gradiente che va dal colore di sfondo al trasparente per nascondere il taglio netto
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: isMobile
                      ? Alignment.bottomCenter
                      : Alignment.centerLeft,
                  end: isMobile ? Alignment.topCenter : Alignment.centerRight,
                  colors: [bgColor, bgColor.withOpacity(0.0)],
                  stops: const [0.0, 0.4],
                ),
              ),
            ),
          ),
        ),

        // --- LIVELLO SUPERIORE: IL TESTO E I BOTTONI ---
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 100,
            vertical: isMobile
                ? 60
                : 120, // Rimosso un po' di spazio in altezza se serve
          ),
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ciao, sono",
                      style: TextStyle(
                        fontSize: 24,
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().fade(duration: 500.ms).slideX(),
                    const SizedBox(height: 16),
                    Text(
                      "Giuseppe Randazzo",
                      style: TextStyle(
                        fontSize: isMobile ? 40 : 64,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ).animate().fade(duration: 600.ms, delay: 200.ms).slideY(),
                    const SizedBox(height: 24),
                    Text(
                      "Sono un Front-End Developer con un solido background nella comunicazione, nella dizione e nel public speaking.\nIl mio motto è:\nCodice che parla. Parola che connette.",
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 20,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      textAlign: isMobile ? TextAlign.center : TextAlign.left,
                    ).animate().fade(duration: 700.ms, delay: 400.ms).slideY(),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: isMobile
                          ? WrapAlignment.center
                          : WrapAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Scarica CV',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Contattami',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ).animate().fade(duration: 800.ms, delay: 600.ms),
                  ],
                ),
              ),
              if (isMobile)
                const SizedBox(
                  height: 200,
                ), // Spazio vuoto se su mobile per scrollare
              if (!isMobile)
                Expanded(
                  flex: 1,
                  child:
                      const SizedBox(), // Rende "invisibile" l'altra metà della griglia in modo che si veda lo sfondo
                ),
            ],
          ),
        ),
      ],
    );
  }
}
