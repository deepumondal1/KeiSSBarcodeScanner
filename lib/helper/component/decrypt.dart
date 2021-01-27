import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:kei_ss_barcodescanner/helper/class/exportClass.dart';

class EncryptDecrypt {
  static var data = 'keiindustriesltd111111111111111111111111111=';
  // static var data = "H7D7eOpBjWFxOdntQfPwTWAjZqdZcKDez5yCBJYqUpE=";
  static Base64Decoder get base => const Base64Decoder();

  static DecodeRetMsg decrypt(String result) {
    try {  
      final _key = Key.fromBase64(base64.encode(base64.decode(data.replaceAll("=","A")).sublist(0,32)));
      // final _key = Key.fromBase64(base64.encode(base64.decode(data.replaceAll("=","A")).sublist(0,32)));
      // final _key2 = base.convert(data, 0, data.length).sublist(0,32); //base64.decode(data);
      final _encrypter = Encrypter(AES(_key, mode: AESMode.ecb));
      var decrypted = _encrypter.decrypt64(result);
      return DecodeRetMsg(status: 1, dataMsg: decrypted, errorMsg: "");
    }catch (e){
      return DecodeRetMsg(status: 0, dataMsg: "No Data Found", errorMsg: e.toString());
    }
  }
}
