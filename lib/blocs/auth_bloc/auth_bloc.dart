// ignore_for_file: unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthLogin) {
          emit(LoginLoading());
          try {
            UserCredential user = await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: event.email, password: event.password);
            emit(LoginSuccess());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              emit(LoginFailure(errMsg: 'User Not Found'));
            } else if (e.code == 'wrong-password') {
              emit(LoginFailure(errMsg: 'Wrong Password'));
            } else {
              emit(LoginFailure(errMsg: 'not found this email or password'));
            }
          } catch (e) {
            emit(LoginFailure(errMsg: 'There was an error'));
          }
        } else if (event is AuthRegister) {
          emit(RegisterLoading());
          try {
            UserCredential user =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.email,
              password: event.password,
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
      },
    );
  }
}
