import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(String filepath, String filename) async {
    File file = File(filepath);
    await storage.ref("remood_file/$filename").putFile(file);
  }

  Future<String> downloadUrl(String filename) async {
    final url = await storage.ref("remood_file/$filename").getDownloadURL();
    return url;
  }
}
