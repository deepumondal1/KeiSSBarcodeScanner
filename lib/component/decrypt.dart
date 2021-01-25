import 'dart:convert';

import 'package:encrypt/encrypt.dart';

class EncryptDecrypt {
  static var data = 'keiindustriesltd111111111111111111111111111=';
  static Base64Decoder get base => const Base64Decoder();

  static String decrypt(String result) {
    // var encrypted = Encrypted.fromBase64(result);
    
    final _key = Key.fromBase64(data);
    final _key2 = base.convert(data, 0, data.length); //base64.decode(data);
    final _encrypter = Encrypter(AES(_key, mode: AESMode.ecb));
    var decrypted = _encrypter.decrypt64(result);
    return decrypted.toString();
  }
}
