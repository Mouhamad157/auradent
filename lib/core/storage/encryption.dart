
import 'dart:convert';

class Encryption {

  static String get _encryptKey => 'F#G82+r73e-8/*K|L.MBx7&vy0\$';

  static const _json = JsonCodec();

  static String encrypt(dynamic plaintext) {
    final keyBytes = utf8.encode(_encryptKey);
    final plaintextBytes = utf8.encode(_applyType(plaintext));
    final encryptedBytes = List<int>.generate(plaintextBytes.length, (i) {
      return plaintextBytes[i] ^ keyBytes[i % keyBytes.length];
    });
    final encryptedString = base64Url.encode(encryptedBytes);
    return encryptedString;
  }

  static dynamic decrypt(String encryptedString) {
    final keyBytes = utf8.encode(_encryptKey);
    final encryptedBytes = base64Url.decode(encryptedString);
    final decryptedBytes = List<int>.generate(encryptedBytes.length, (i) {
      return encryptedBytes[i] ^ keyBytes[i % keyBytes.length];
    });
    final decryptedString = utf8.decode(decryptedBytes);
    return _getWithType(decryptedString);
  }

  static String _applyType(dynamic x){
    if(x == null) {
      throw Exception('Written value cannot be null');
    }
    var xString = '${DateTime.now().toString().replaceAll("-", "p")}-${x.hashCode}-$x';
    if(x is num)
      return 'num-$xString';
    if(x is String)
      return 'string-$xString';
    if(x is bool)
      return 'bool-$xString';
    return 'json-${DateTime.now().toString().replaceAll("-", "p")}-${x.hashCode}-${_json.encode(x)}';
  }

  static dynamic _getWithType(String x){
    var list = x.split('-');
    var type = list.first;
    switch(type){
      case 'num' :
        return int.parse(list.last);
      case 'bool':
        return list.last == 'true';
      case 'json':
        return  _json.decode(x.getValue);
      default:
        return x.getValue;
    }
  }


}


extension _index on String {


  String get getValue {

    var inx  = 0;
    int count = 0;
    for(int i = 0 ; i < length ; i++) {
      if(this[i] == '-') {
        inx = i;
        count ++;
      }
      if(count >= 3) break;
    }
    return substring(inx+1);
  }
}