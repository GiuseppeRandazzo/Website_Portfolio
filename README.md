# 🚀 Giuseppe Randazzo | Junior Flutter Developer

[![Flutter Web Deployment](https://github.com/GiuseppeRandazzo/pratico_portfolio/actions/workflows/deploy.yml/badge.svg)](https://github.com/GiuseppeRandazzo/pratico_portfolio/actions)

> **🌍 LIVE DEMO**: [Visita il mio Portfolio](https://GiuseppeRandazzo.github.io/pratico_portfolio/)

Ciao! Sono un appassionato sviluppatore Junior orientato al mondo Mobile e Web. Questo portfolio rappresenta il mio percorso di apprendimento e la mia dedizione nel creare interfacce moderne, pulite e funzionali utilizzando **Flutter**.

Il mio obiettivo con questo progetto è mostrare come sto applicando i concetti di UI/UX, gestione dei widget e architettura del codice per costruire soluzioni digitali che siano non solo belle da vedere, ma anche solide sotto il cofano.

## 🎯 Cosa ho voluto dimostrare con questo progetto

- **Curiosità e Apprendimento**: L'integrazione di pacchetti come `flutter_animate` per dare un tocco di dinamismo.
- **Attenzione al Dettaglio**: La gestione della responsività per far sì che il sito si legga bene ovunque.
- **Mentalità DevOps**: Ho configurato una GitHub Action per automatizzare il rilascio online, imparando a gestire il ciclo di vita del software.
- **Codice Pulito**: Organizzazione dei file in componenti separati (widgets, screens, utils) per rendere il progetto scalabile.

## ✨ Caratteristiche Tecniche

- **Layout Adattivo**: Navigazione ottimizzata per Mobile, Tablet e Desktop.
- **Dark Mode**: Implementazione del supporto al tema scuro per migliorare l'accessibilità.
- **Asset Management**: Gestione di immagini personalizzate e font moderni.

## 🛠️ Cosa ho utilizzato

- **Framework**: Flutter & Dart
- **Librerie**: `flutter_animate`, `google_fonts`, `url_launcher`
- **Automation**: GitHub Actions per il Deploy continuo

## 📁 Architettura della Repository

- `lib/widgets/` - Dove ho "smontato" l'interfaccia in pezzi più piccoli e gestibili.
- `lib/utils/responsive.dart` - Il cuore logico che decide come mostrare i contenuti in base allo schermo.
- `lib/screens/` - Le pagine principali dell'app.

## 🚀 Prossimi Passi (Roadmap)
- [ ] Aggiungere una sezione "Contatti" con validazione dei campi.
- [ ] Implementare una galleria di progetti dinamica.
- [ ] Approfondire la gestione dello stato per rendere l'app ancora più reattiva.

---
*Sto studiando ogni giorno per migliorare. Se vuoi scambiare due chiacchiere o darmi un feedback sul codice, contattami pure!*


## ✨ Caratteristiche

- **Design Responsivo**: Layout adattivo progettato per performare al meglio su schermi di ogni dimensione (Mobile, Tablet, Desktop) grazie al widget custom `Responsive`.
- **Tema Dark & Light**: Supporto nativo per tema chiaro e tema scuro con switch dinamico in esecuzione.
- **Animazioni Fluide**: Utilizzo intensivo del pacchetto `flutter_animate` per transizioni, fade-in ed interazioni morbide che arricchiscono la UX.
- **Supporto multi-piattaforma**: Ideato primariamente per il Web, ma pienamente compatibile con Android, iOS, macOS, Windows e Linux in caso di build native.

## 🛠️ Tecnologie Utilizzate

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Animazioni**: `flutter_animate` 
- **Tipografia**: `google_fonts` (Outfit)
- **Routing & Link esterni**: `url_launcher`

## 📁 Struttura del Progetto

Il progetto segue una separazione chiara e semplice dei componenti per mantenere il codice leggibile:

- `lib/main.dart` - Entry point e configurazioni base dell'app.
- `lib/theme/app_theme.dart` - Definizione puntuale del ThemeData per la Dark e Light Mode.
- `lib/screens/home_page.dart` - Schermata principale che racchiude l'interfaccia a scorrimento verticale.
- `lib/widgets/` - Contiene tutte le sezioni modulari e riutilizzabili.
- `lib/utils/responsive.dart` - Utility per la gestione dinamica del viewport.

## ⚙️ Installazione ed Esecuzione Locale

Questa app è pronta all'uso. Segui questi passi per eseguirla localmente:

1. **Clona la Repository**:
   ```bash
   git clone https://github.com/GiuseppeRandazzo/pratico_portfolio.git
   cd pratico_portfolio
   ```

2. **Scarica le dipendenze**:
   ```bash
   flutter pub get
   ```

3. **Esegui l'app (per il web)**:
   ```bash
   flutter run -d chrome
   ```

## 📬 Obiettivi Futuri e Iterazioni
- Integrazione dinamica form Contatti
- Sezione Progetti interattiva con fetch dinamico dati da server o API.
- Supporto i18n per Multilingua (IT/EN)

---
*Progettato e sviluppato con ❤️ in Flutter da [Giuseppe Randazzo](https://github.com/GiuseppeRandazzo).*

Se vuoi fare due chiacchiere o collaborare ad un progetto, puoi trovarmi su:
- [GitHub](https://github.com/GiuseppeRandazzo)

---
*Creato con 💙 e ☕ da Giuseppe Randazzo.*
