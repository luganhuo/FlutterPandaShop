@TestOn("vm")

import 'dart:core';
import "package:test/test.dart";
import '../lib/variable_helper.dart';

void main() {
  test("Common testing", () {
    
    List<List<String>> samples = List<List<String>>();
    samples.add(["-ZH", "_ZH"]);
    samples.add(["/hello", "_hello"]);
    samples.add([" ", "_"]);
    samples.add(["onboarding_iphone6_vip_proposition_screen3", "onboarding_iphone6_vip_proposition_screen3"]);
    
    for (var eachSample in samples) {
      expect(normalizeVariableName(eachSample[0]), equals(eachSample[1]));
    }
  
  });
}