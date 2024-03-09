import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrresult='Scanned Data Will appear here';
  Future<void> ScanQR()async{
    try{
      final qrCode= await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrresult=qrCode.toString();
      });
    }on PlatformException{
      qrresult="Fail to read QR Code";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
            child: Text('QR Code Scanner and Generator')
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30.0,),
            Text('$qrresult',style: TextStyle(color: Colors.black),),
            SizedBox(height: 30.0,),
            ElevatedButton(onPressed: ScanQR, child: Text('Scan Code')),
          ],
        ),
      ),
    );
  }
}
