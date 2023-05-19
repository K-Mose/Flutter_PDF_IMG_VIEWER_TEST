import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class IMGViewerPage extends StatefulWidget {
  final File file;
  const IMGViewerPage({Key? key, required this.file}) : super(key: key);

  @override
  State<IMGViewerPage> createState() => _IMGViewerPageState();
}

class _IMGViewerPageState extends State<IMGViewerPage> {

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final file = File(widget.file.path);
    print(widget.file.path);
    return Scaffold(
      appBar: AppBar(title: Text(name),),
      body: Image.file(file),
    );
  }
}

