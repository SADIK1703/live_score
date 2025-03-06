import 'package:flutter/material.dart';
import 'package:live_score/core/init/dependency_injector.dart';
import 'package:live_score/features/scores/_.export.dart';
import 'package:live_score/product/style/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjector().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Live Match Score',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const ScoresListPage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      );
}
