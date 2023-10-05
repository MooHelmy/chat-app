import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit_Sataes.dart';

class Login_cubit extends Cubit<LoginStates>{
  Login_cubit(super.LoginStatesIntial);

  Future<void> FireAuth({required String email,required String password}) async {
    emit(LoginStatesLoding());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginStatesSuccess());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginStatesFalier(Message: 'weak-password'));

      } else if (e.code == 'email-already-in-use') {
        emit(LoginStatesFalier(Message: 'email is already'));

      }
    }
    on Exception catch (e) {
      emit(LoginStatesFalier(Message: 'Something went Wrong'));
    }

  }

}