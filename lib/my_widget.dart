import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/zenburn.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var code = '''
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
}
''';

    return HighlightView(
      // The original code to be highlighted
      code,

      // Specify language
      // It is recommended to give it a value for performance
      language: 'dart',

      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: zenburnTheme,

      // Specify padding
      padding: EdgeInsets.all(12),

      // Specify text style
      textStyle: TextStyle(
        fontFamily: 'Courier New',
        fontSize: 16,
      ),
    );
  }
}