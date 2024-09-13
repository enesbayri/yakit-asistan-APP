import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class CloudstoreDatabase {
  FirebaseStorage? instance;
  CloudstoreDatabase() {
    instance = FirebaseStorage.instance;
  }

  Future<String> addImageToCloudStore(
      String userId, String carname, File file) async {
    try {
      var profileRef = instance!.ref("images/$userId/$carname.png");
      await profileRef.putFile(file);
      return await profileRef.getDownloadURL();
    } catch (e) {
      return "";
    }
  }

  Future<void> deleteImageToCloudStore(String userId, String carname) async {
    try {
      var profileRef = instance!.ref("images/$userId/$carname.png");
      await profileRef.delete();
    } catch (e) {
      debugPrint("delete car image error!");
    }
  }
}
