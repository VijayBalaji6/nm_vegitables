import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/utils/common_utils.dart';

class AuthDataSource {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> userSignUp(
      {
        required String name,
        required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final userInfo = FirebaseAuth.instance.currentUser;
      await userInfo?.updateDisplayName(name);
      await auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
          await userInfo?.linkWithCredential(phoneAuthCredential);
        },
        verificationFailed: (FirebaseAuthException e) {
          CommonUtils.log(e);
        },
        codeSent: (String verificationId, int? resendToken) async {
          // write the code to handle the OTP code sent for manual verification in case autoverify doesn't work
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Do Something for SMS request timeout
        },
      );
      return true;
    } on FirebaseAuthException catch (e) {
      CommonUtils.log(e.message);
      return false;
    }
  }

  Future<bool> signInUsingEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      CommonUtils.log(e.message);
      return false;
    }
  }

  Future<bool> signInUsingPhone(String email, String password) async {
    try {
      await auth.signInWithPhoneNumber('+91$email');
      return true;
    } on FirebaseAuthException catch (e) {
      CommonUtils.log(e.message);
      return false;
    }
  }

  Future<bool> sendPasswordResetEmail() async {
    try {
      await auth.sendPasswordResetEmail(email: '');
      return true;
    } on FirebaseAuthException catch (e) {
      CommonUtils.log(e.message);
      return false;
    }
  }

  Future<bool> verifyPasswordResetCode() async {
    try {
      await auth.verifyPasswordResetCode('');
      return true;
    } on FirebaseAuthException catch (e) {
      CommonUtils.log(e.message);
      return false;
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
