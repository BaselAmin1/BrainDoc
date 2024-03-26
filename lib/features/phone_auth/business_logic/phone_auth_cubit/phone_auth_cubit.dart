import 'package:BrainDoc/core/cache_helper/cache_helper.dart';
import 'package:BrainDoc/core/cache_helper/cache_values.dart';
import 'package:BrainDoc/core/di.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;
  late String phoneNumber;
  late String otpCode;
  PhoneAuthCubit() : super(PhoneAuthInitial());

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> submitPhoneNumber() async {
    emit(Loading());
    await auth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(ErrorOccurred(errorMsg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        await getIt<CacheHelper>().saveData(key: CacheKeys.uid, value: value.user!.uid);
        checkNewUser();
      });
    } catch (error) {
      emit(ErrorOccurred(errorMsg: error.toString()));
    }
  }

  Future<void> checkNewUser() async {
    try {
      String uid = auth.currentUser!.uid;
      DocumentSnapshot userSnapshot =
          await firestore.collection('users').doc(uid).get();
      if (!userSnapshot.exists) {
        await firestore.collection('users').doc(uid).set({
          'phone': phoneNumber,
        });
        emit(LoginNewUser());
      } else {
        emit(PhoneOTPVerified());
      }
    } catch (error) {
      emit(ErrorOccurred(errorMsg: error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
