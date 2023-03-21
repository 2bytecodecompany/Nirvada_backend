import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatelessWidget {
  final String data;
  final double size;

  QRCodeGenerator(
    this.data,
    this.size,
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: QrImage(
        data: data,
        version: QrVersions.auto,
        size: size,
        gapless: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        errorCorrectionLevel: QrErrorCorrectLevel.Q,
      ),
    );
  }
}
