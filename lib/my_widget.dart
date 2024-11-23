import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/zenburn.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:flutter_highlight/themes/vs.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

const Map<String, String> sampleCodes = {
  'Markdown': '''
# Hello, World!

## This is a second level heading

> This is a block quote.
>
> It can span multiple paragraphs,
> if you like.

* This is a list item.
* This is another one.

---

Here is some inline \`code\`.

\`\`\`dart
main() {
  print("Hello, World!");
}
\`\`\`

## Tables

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | \$1600 |
| col 2 is      | centered      | \$12    |
| zebra stripes | are neat      | \$1    |

''',
  'Dart': '''
main() {
  print("Hello, World!");
  
  HighlightView(
    // The original code to be highlighted
    code,

    // Specify language
    language: 'dart',

    // Specify highlight theme
    theme: zenburnTheme,

    // Specify padding
    padding: EdgeInsets.all(12),

    // Specify text style
    textStyle: TextStyle(
      fontFamily: 'My awesome monospace font',
      fontSize: 16,
    ),
  );
}''',
};

const Map<String, Map<String, TextStyle>> highlightThemes = {
  'Zenburn': zenburnTheme,
  'GitHub': githubTheme,
  'Dracula': draculaTheme,
  'VS': vsTheme,
  'Atom One Dark': atomOneDarkTheme,
};

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String selectedLanguage = 'Markdown';
  String selectedTheme = 'Zenburn';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PopupMenuButton<String>(
              initialValue: selectedLanguage,
              onSelected: (String language) {
                setState(() {
                  selectedLanguage = language;
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
            PopupMenuButton<String>(
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
          ],
        ),
        Expanded(
          child: HighlightView(
            sampleCodes[selectedLanguage]!,
            language: selectedLanguage.toLowerCase(),
            theme: highlightThemes[selectedTheme]!,
            padding: const EdgeInsets.all(12),
            textStyle: const TextStyle(
              fontFamily: 'Courier New',
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}