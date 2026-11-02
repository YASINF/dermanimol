import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('açık tema marka renklerini kullanır', () {
    final theme = AppTheme.light();
    expect(theme.colorScheme.primary, AppColors.navy);
    expect(theme.colorScheme.tertiary, AppColors.red);
    expect(theme.scaffoldBackgroundColor, AppColors.background);
  });

  test('koyu tema koyu parlaklıktadır', () {
    expect(AppTheme.dark().colorScheme.brightness, Brightness.dark);
  });
}
