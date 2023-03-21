import 'package:encrypt/encrypt.dart';

class QRFucntions {
  static String qrVoterID = "";
  static void encrypt(String text) {
    final key = Key.fromUtf8("Nitin, Aditya, Divyanshu, Ali, a");
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    print(decrypted);
    qrVoterID = encrypted.base64;
    print(encrypted.base64);
  }
}
