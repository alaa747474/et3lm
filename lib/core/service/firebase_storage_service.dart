import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService {
  FireStorageService._();
  static final instance = FireStorageService._();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String> saveFilesToFirebaseStorage(
      String folderPath, String filePath, File file) async {
     Reference referenceRoot = _storage.ref().child(folderPath);
    Reference reference = referenceRoot.child(filePath);
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return taskSnapshot.ref.getDownloadURL();
  }
}
