import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionDemo extends StatefulWidget {
  const EncryptionDemo({super.key});

  @override
  State<EncryptionDemo> createState() => _EncryptionDemoState();
}

class _EncryptionDemoState extends State<EncryptionDemo> {

  var encryptedText = '';
  var decryptedText = '';
  late final encrypted;
  final key = encrypt.Key.fromBase64("dhairyasiddheshyuthikasawantrane");
  final iv = encrypt.IV.fromLength(16);
  encrypt.Encrypter get encrypter => encrypt.Encrypter(encrypt.AES(key));

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Encryption Demo")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                label: Text('Write something...'),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusColor: Colors.white,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              cursorColor: Colors.white,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  encrypted = encrypter.encrypt(_controller.text, iv: iv);
                  setState(() {
                    encryptedText = encrypted.base64;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1f1f1f),
                ),
                child: const Text("Encrypt", style: TextStyle(color: Colors.white, fontSize: 17), ),
              ),
            ),
            SizedBox(height: 15,),
            Text('$encryptedText'),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  decryptedText = encrypter.decrypt(encrypted, iv: iv);
                  setState(() {

                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1f1f1f),
                ),
                child: const Text("Decrypt", style: TextStyle(color: Colors.white, fontSize: 17), ),
              ),
            ),
            SizedBox(height: 15,),
            Text('$decryptedText'),
          ],
        ),
      ),
    );
  }
}
