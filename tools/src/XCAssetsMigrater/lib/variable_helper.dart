import 'dart:core';

String normalizeVariableName(String origin) { 

  if (origin == null) { return null; }

  String result = origin;

  String rule = r'[ \/!@#$%^&\*\-=+:;,.?]';

  if (origin.contains(RegExp(rule))) {
    result = origin.replaceAll(RegExp(rule), '_');
  } else {
    result = origin;
  }

  return result;
}