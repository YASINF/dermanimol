import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DermanimOlApp());

class DermanimOlApp extends StatelessWidget {
  const DermanimOlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dermanım Ol',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const SkeletonHome(
        title: 'Dermanım Ol',
        subtitle: 'Dermanın cebinde, eczanen yanında.',
      ),
    );
  }
}
