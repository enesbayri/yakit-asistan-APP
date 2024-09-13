import 'dart:io';

import 'package:yakit_asistan/authentication/firebase_auth.dart';
import 'package:yakit_asistan/database/firebase_cloudstorage.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';

class CloudstoreRepository {
  var cloudstore = locator<CloudstoreDatabase>();
  Future<String> addImgToCloudStore(
      String userId, String carname, File file) async {
    var auth = locator<FirebaseAuthentication>();
    String? userId = auth.getUserId();
    if (userId != null) {
      String url = await cloudstore.addImageToCloudStore(userId, carname, file);
      return url;
    } else {
      return "";
    }
  }

  Future<void> deleteCarImageToCloudstore(String userId, String carname) async {
    await cloudstore.deleteImageToCloudStore(userId, carname);
  }
}
