import 'package:flutter_test/flutter_test.dart';

import '../lib/config/obfuscator.dart';

void main() {
  test("Testing obfuscator...", () {
    expect(Obfuscator.apiClientID(), "farfetch_chinaApp");
    expect(Obfuscator.apiClientSecret(), "53C1E314-AFAF-460F-8904-F6D5C52D4DAC");
  });
}
