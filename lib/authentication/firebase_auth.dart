import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yakit_asistan/authentication/authentication.dart';

class FirebaseAuthentication extends Authentication {
  late FirebaseAuth auth;
  FirebaseAuthentication() {
    auth = FirebaseAuth.instance;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String userName) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    await updateUserName(userName);
    await sendUserEmailVerification();
    await signOutUser();
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    var userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await auth.signInWithCredential(credential);
  }

  Future<void> signInWithPhone(
      String phoneNumber,
      Future<String> Function() getCode,
      void Function() verifyComplated,
      void Function(FirebaseAuthException) verifyFailed) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await auth.signInWithCredential(phoneAuthCredential);
          verifyComplated();
        },
        verificationFailed: (error) {
          verifyFailed(error);
        },
        codeSent: (verificationId, forceResendingToken) async {
          //It enables interaction in the user interface with the "getCode" function and receives the SMS code from the user.
          String userSmsCode = await getCode();
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: userSmsCode);
          await auth.signInWithCredential(credential);
          verifyComplated();
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOutUser() async {
    var user = GoogleSignIn().currentUser;
    if (user != null) {
      await GoogleSignIn().signOut();
    }
    if (auth.currentUser != null) {
      await auth.signOut();
    }
  }

  Future<void> deleteUser() async {
    if (auth.currentUser != null) {
      await auth.currentUser!.delete();
    }
  }

  Future<void> sendUserEmailVerification() async {
    if (auth.currentUser != null) {
      await auth.currentUser!.sendEmailVerification();
    }
  }

  Future<void> updateMail(String email) async {
    if (auth.currentUser != null) {
      await auth.currentUser!.verifyBeforeUpdateEmail(email);
    }
  }

  Future<void> updatePassword(String password, String lastPassword) async {
    if (auth.currentUser != null) {
      var credential = EmailAuthProvider.credential(
          email: auth.currentUser!.email!, password: lastPassword);
      await auth.currentUser!.reauthenticateWithCredential(credential);
      await auth.currentUser!.updatePassword(password);
      await signOutUser();
    }
  }

  Future<void> updateUserName(String userName) async {
    if (auth.currentUser != null) {
      await auth.currentUser!.updateDisplayName(userName);
    }
  }

  Future<void> refreshCurrentUser() async {
    if (auth.currentUser != null) {
      await auth.currentUser!.reload();
    }
  }

  Future<void> sendPasswordResetCode(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Stream<User?> userState() {
    return auth.authStateChanges();
  }

  Stream<String> getEmailStream() {
    return auth.userChanges().map((user) =>
        ((user != null && user.email != null) ? user.email! : "Yakıt Asistan"));
  }

  Stream<String> getUsernameStream() {
    return auth.userChanges().map((user) =>
        ((user != null && user.displayName != null)
            ? user.displayName!
            : "Yakıt Asistan"));
  }

  String getEmail() {
    if (auth.currentUser != null) {
      return auth.currentUser!.email!;
    } else {
      return "Yakıt Asistan";
    }
  }

  String getUserName() {
    if (auth.currentUser != null) {
      return auth.currentUser!.displayName!;
    } else {
      return "Yakıt Asistan";
    }
  }

  String? getUserId() {
    if (auth.currentUser != null) {
      return auth.currentUser!.uid;
    } else {
      return null;
    }
  }

  bool? getUserEmailVerified() {
    if (auth.currentUser != null) {
      return auth.currentUser!.emailVerified;
    }
    return null;
  }
}
