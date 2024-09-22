// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailuer(errMsg: 'Weak Password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailuer(errMsg: 'Email Already Exist'));
      } else {
        emit(RegisterFailuer(errMsg: 'error in this email and password'));
      }
    } catch (e) {
      emit(RegisterFailuer(errMsg: 'something wrong'));
    }
  }
}
