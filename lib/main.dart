import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_test/api/img_api.dart';
import 'package:pdf_test/api/pdf_api.dart';
import 'package:pdf_test/page/img_viewer_page.dart';
import 'package:pdf_test/page/pdf_viewer_page.dart';
import 'package:pdf_test/widget/button_widget.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'PDF Viewer';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: 'Asset PDF',
              onClicked: () async {
                // final path = 'assets/sample.pdf';
                // final file = await PDFApi.loadAsset(path);
                // openPDF(context, file);
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'File PDF',
              onClicked: () async {
                // final file = await PDFApi.pickFile();
                //
                // if (file == null) return;
                // openPDF(context, file);
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'Network PDF',
              onClicked: () async {
                final url =
                    '';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
            ),const SizedBox(height: 16),
            ButtonWidget(
              text: 'Network IMG',
              onClicked: () async {
                final url =
                    '';
                final file = await IMGApi.loadNetwork(url);
                openIMG(context, file);
              },
            ),
          ],
        ),
      ),
    ),
  );

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );
  void openIMG(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => IMGViewerPage(file: file))
  );
}