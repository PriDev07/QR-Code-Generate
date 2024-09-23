import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey globalKey = GlobalKey();
  String qrData = "";
  TextEditingController mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR CODE GENERATOR"),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            RepaintBoundary(
              key: globalKey,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: qrData.isEmpty
                      ? Text(
                          "Enter data to generate qr code",
                          style: TextStyle(fontSize: 24),
                        )
                      : QrImageView(
                          data: qrData,
                          version: QrVersions.auto,
                          size: 200,
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: mycontroller,
                decoration: InputDecoration(
                    hintText: "Enter Data", border: OutlineInputBorder()),
                
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    qrData = mycontroller.text;
                  });
                },
                child: Text("Generate"))
          ],
        ),
      ),
    );
  }
}
