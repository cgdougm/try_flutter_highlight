import 'package:flutter/material.dart';
import 'package:try_flutter_highlight/demo_highlight.dart';

void main() => runApp(const MyApp());

const String title = 'Flutter Highlight Demo';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  DemoPageState createState() => DemoPageState();
}

class DemoPageState extends State<DemoPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: DemoHighlightWidget(),
      ),
    );
  }
}