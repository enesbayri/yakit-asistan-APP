// ignore_for_file: empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:yakit_asistan/authentication/firebase_auth.dart';
import 'package:yakit_asistan/locator/getit_locator.dart';

class AuthService {
  final FirebaseAuthentication firebaseAuth = locator<FirebaseAuthentication>();

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email, password, userName);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw ("Mail adresi zaten kullanımda!");
      } else if (e.code == "invalid-email") {
        throw ("Geçersiz mail adresi!");
      } else if (e.code == "weak-password") {
        throw ("Zayıf şifre!");
      } else {
        throw ("Bir hata oluştu!");
      }
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      var user = await firebaseAuth.signInWithEmailAndPassword(email, password);
      if (!user!.emailVerified) {
        firebaseAuth.signOutUser();
        throw "not-verified-email";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        throw ("Geçersiz mail adresi!");
      } else if (e.code == "user-disabled") {
        throw ("Kullanıcı engellenmiştir!");
      } else if (e.code == "user-not-found") {
        throw ("Kullanıcı bulunamadı!");
      } else if (e.code == "invalid-credential") {
        throw ("Email yada şifre hatalı!");
      } else {
        throw ("Bir hata oluştu!");
      }
    } on String {
      throw "Mail adresinizi onaylayın!";
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await firebaseAuth.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        throw ("Geçersiz mail adresi!");
      } else if (e.code == "user-disabled") {
        throw ("Kullanıcı engellenmiştir!");
      } else if (e.code == "user-not-found") {
        throw ("Kullanıcı bulunamadı!");
      } else if (e.code == "invalid-credential") {
        throw ("Email yada şifre hatalı!");
      } else {
        throw ("Bir hata oluştu!");
      }
    }
  }

  Future<void> signInWithPhone(
      {required String phoneNumber,
      required Future<String> Function() getCode,
      required void Function() verifyComplated,
      required void Function(FirebaseAuthException) verifyFailed}) async {
    try {
      await firebaseAuth.signInWithPhone(
          phoneNumber, getCode, verifyComplated, verifyFailed);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-verification-code") {
        throw ("SMS kodu hatalı!");
      } else if (e.code == "user-disabled") {
        throw ("Kullanıcı engellenmiştir!");
      } else if (e.code == "user-not-found") {
        throw ("Kullanıcı bulunamadı!");
      } else if (e.code == "invalid-credential") {
        throw ("Hatalı giriş!");
      } else {
        throw ("Bir hata oluştu!");
      }
    } catch (e) {
      throw ("Opps.Lütfen daha sonra tekrar deneyin");
    }
  }

  Future<void> signOutUser() async {
    try {
      await firebaseAuth.signOutUser();
    } catch (e) {
      throw ("Bir hata oluştu!");
    }
  }

  Future<void> deleteUser() async {
    try {
      await firebaseAuth.deleteUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        await signOutUser();
        throw ("Lütfen önce tekrar giriş yapın!");
      } else {
        throw ("Bir hata oluştu!");
      }
    }
  }

  Future<void> sendUserEmailVerification() async {
    try {
      await firebaseAuth.sendUserEmailVerification();
    } catch (e) {
      throw ("Bir hata oluştu!");
    }
  }

  Future<void> updateMail(String email) async {
    try {
      await firebaseAuth.updateMail(email);
      await refreshCurrentUser();
    } catch (e) {
      throw ("Bir hata oluştu!");
    }
  }

  Future<void> updatePassword(String password, String lastPassword) async {
    try {
      await firebaseAuth.updatePassword(password, lastPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-credential" || e.code == "wrong-password") {
        throw ("Eski şifreniz hatalı!");
      } else if (e.code == "weak-password") {
        throw ("Zayıf şifre!");
      } else {
        throw ("Bir hata oluştu!");
      }
    }
  }

  Future<void> updateUserName(String userName) async {
    try {
      await firebaseAuth.updateUserName(userName);
      await refreshCurrentUser();
    } catch (e) {}
  }

  Future<void> refreshCurrentUser() async {
    await firebaseAuth.refreshCurrentUser();
  }

  Future<void> sendPasswordResetCode(String email) async {
    try {
      await firebaseAuth.sendPasswordResetCode(email);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        throw ("Geçersiz email!");
      } else {
        throw ("Bir hata oluştu!");
      }
    }
  }

  String getEmail() {
    return firebaseAuth.getEmail();
  }

  String getUserName() {
    return firebaseAuth.getUserName();
  }

  String? getUserId() {
    return firebaseAuth.getUserId();
  }

  Stream<String> getEmailStream() {
    return firebaseAuth.getEmailStream();
  }

  Stream<String> getUsernameStream() {
    return firebaseAuth.getUsernameStream();
  }

  Stream<User?> userState() {
    return firebaseAuth.userState();
  }

  bool? getUserEmailVerified() {
    return firebaseAuth.getUserEmailVerified();
  }
}
