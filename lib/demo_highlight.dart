import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/zenburn.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:try_flutter_highlight/code_samples.dart';
import 'package:desktop_drop/desktop_drop.dart';

const Map<String, Map<String, TextStyle>> highlightThemes = {
  'Zenburn': zenburnTheme,
  'GitHub': githubTheme,
  'Dracula': draculaTheme,
  'VS': vsTheme,
  'Atom One Dark': atomOneDarkTheme,
};

// Add fonts map
const Map<String, String> monospacedFonts = {
  'Courier New': 'Courier New',
  'Consolas': 'Consolas',
  'Monaco': 'Monaco',
};

class DemoHighlightWidget extends StatefulWidget {
  const DemoHighlightWidget({super.key});

  @override
  State<DemoHighlightWidget> createState() => _DemoHighlightWidgetState();
}

class _DemoHighlightWidgetState extends State<DemoHighlightWidget> {
  String selectedLanguage = 'Markdown';
  String selectedTheme = 'Zenburn';
  String selectedFont = 'Courier New';
  String currentCode = '';

  @override
  void initState() {
    super.initState();
    currentCode = sampleCodes['Markdown']!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Language selector
              PopupMenuButton<String>(
                tooltip: 'Language',
                initialValue: selectedLanguage,
                onSelected: (String language) {
                  setState(() {
                    selectedLanguage = language;
                    currentCode = sampleCodes[language]!;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return sampleCodes.keys.map((String language) {
                    return PopupMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(selectedLanguage),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),

              // Theme selector
              PopupMenuButton<String>(
                tooltip: 'Theme',
                initialValue: selectedTheme,
                onSelected: (String theme) {
                  setState(() {
                    selectedTheme = theme;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return highlightThemes.keys.map((String theme) {
                    return PopupMenuItem<String>(
                      value: theme,
                      child: Text(theme),
                    );
                  }).toList();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(selectedTheme),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              // Font selector
              PopupMenuButton<String>(
                tooltip: 'Font',
                initialValue: selectedFont,
                onSelected: (String font) {
                  setState(() {
                    selectedFont = font;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return monospacedFonts.keys.map((String font) {
                    return PopupMenuItem<String>(
                      value: font,
                      child: Text(font),
                    );
                  }).toList();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(selectedFont),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: DropTarget(
            onDragDone: (details) async {
              if (details.files.isEmpty) return;
              try {
                final file = details.files.first;
                final contents = await file.readAsString();
                setState(() {
                  currentCode = contents;
                });
              } catch (e) {
                debugPrint('Error reading file: $e');
              }
            },
            child: HighlightView(
              currentCode,
              language: selectedLanguage.toLowerCase(),
              theme: highlightThemes[selectedTheme]!,
              padding: const EdgeInsets.all(12),
              textStyle: TextStyle(
                fontFamily: monospacedFonts[selectedFont],
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
