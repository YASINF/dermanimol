import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DermanimOlEczaciApp());

class DermanimOlEczaciApp extends StatelessWidget {
  const DermanimOlEczaciApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dermanım Ol Eczacı',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const SkeletonHome(
        title: 'Dermanım Ol Eczacı',
        subtitle: 'Gelen talepleri gör, 15 saniyede yanıtla.',
      ),
    );
  }
}
