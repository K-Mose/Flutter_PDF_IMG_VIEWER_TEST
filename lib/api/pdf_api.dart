import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class PDFApi {
  // 파일 다운로드
  static Future<File> loadNetwork(String url) async {
    final response = await http.get(url);
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes)  async {
    final filename = basename(url); // 파일 이름
    final dir = await getApplicationDocumentsDirectory(); // 저장할 디렉터리
    // 파일로 저장
    final file = File("${dir.path}/$filename");
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}