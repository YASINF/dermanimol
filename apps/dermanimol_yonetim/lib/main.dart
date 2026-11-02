import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DermanimOlYonetimApp());

class DermanimOlYonetimApp extends StatelessWidget {
  const DermanimOlYonetimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dermanım Ol Yönetim',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: const SkeletonHome(
        title: 'Dermanım Ol Yönetim',
        subtitle: 'Eczane başvuruları, katalog, raporlar ve ayarlar.',
      ),
    );
  }
}
