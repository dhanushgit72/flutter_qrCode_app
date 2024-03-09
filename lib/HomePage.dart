import 'package:flutter/material.dart';
import 'package:qr_code_scanner_generator/generate_qrcode.dart';
import 'package:qr_code_scanner_generator/scan_qrcode.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScanQRCode()));
            }, child: Text("Scan QR code")),
            SizedBox(height: 40.0,),
            ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GenerateQRCode()));
            }, child: Text("Generate QR Code"))
          ],
        ),
      ),
    );
  }
}
