import 'package:flutter/widgets.dart';

class Spacing {
  static const double m = 24.0;
  static const double s = 12.0;
  static const double xs = 6.0;
  static const double xxs = 4.0;
  static const double xxxs = 2.0;
  static const double xxxxs = 1.0;

  static const SizedBox horizonM = const SizedBox(width: Spacing.m);
  static const SizedBox horizonS = const SizedBox(width: Spacing.s);
  static const SizedBox horizonXS = const SizedBox(width: Spacing.xs);
  static const SizedBox horizonXXS = const SizedBox(width: Spacing.xxs);
  static const SizedBox horizonXXXS = const SizedBox(width: Spacing.xxxs);
  static const SizedBox horizonXXXXS = const SizedBox(width: Spacing.xxxxs);

  static const SizedBox verticalM = const SizedBox(height: Spacing.m);
  static const SizedBox verticalS = const SizedBox(height: Spacing.s);
  static const SizedBox verticalXS = const SizedBox(height: Spacing.xs);
  static const SizedBox verticalXXS = const SizedBox(height: Spacing.xxs);
  static const SizedBox verticalXXXS = const SizedBox(height: Spacing.xxxs);
  static const SizedBox verticalXXXXS = const SizedBox(height: Spacing.xxxxs);
}
