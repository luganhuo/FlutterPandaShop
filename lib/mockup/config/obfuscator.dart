import 'dart:convert';

import 'package:crypto/crypto.dart';

class Obfuscator {
  static String apiClientID() {
    return _removeObfuscationFrom(_apiClientIDSamples, _apiClientIDSamples.length);
  }

  static String apiClientSecret() {
    return _removeObfuscationFrom(_obfuscatedKey, _obfuscatedKey.length);
  }

  static String _removeObfuscationFrom(List<int> value, int length) {
    var className = utf8.encode(_privateObfuscateKey);
    var obfuscator = sha1.convert(className);

    List<int> actualKey = List<int>(length);
    for (int idx = 0; idx < length; idx++) {
      actualKey[idx] = value[idx] ^ obfuscator.bytes[idx % _CC_SHA1_DIGEST_LENGTH];
    }

    return String.fromCharCodes(actualKey);
  }

  static const int _CC_SHA1_DIGEST_LENGTH = 20;
  static const String _privateObfuscateKey = "FFSObfuscator";
  static const List<int> _apiClientIDSamples = [
    0x14,
    0x11,
    0xe2,
    0xcc,
    0x23,
    0xce,
    0xe5,
    0xdd,
    0xe8,
    0x68,
    0xfa,
    0xa9,
    0x22,
    0xc0,
    0xb9,
    0x74,
    0x99
  ];
  static const List<int> _obfuscatedKey = [
    0x47,
    0x43,
    0xd3,
    0x9b,
    0x03,
    0x89,
    0xb7,
    0x81,
    0x9a,
    0x4a,
    0xd4,
    0x81,
    0x0a,
    0x8c,
    0xcc,
    0x32,
    0xd9,
    0x64,
    0x67,
    0x5b,
    0x4b,
    0x40,
    0xa4,
    0x87,
    0x00,
    0x8c,
    0xc2,
    0x80,
    0xf4,
    0x3e,
    0xa0,
    0x84,
    0x78,
    0xe5,
    0xb9,
    0x47
  ];
}
