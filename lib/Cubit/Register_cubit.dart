import 'package:chatt_app/Cubit/Cubit_Sataes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register_cubit extends Cubit<LoginStates>{
  Register_cubit(super.LoginStatesIntial);
  Future<void> FireAuthRegister({required String email,required String password}) async {
    emit(LoginStatesLoding());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email, password: password);
      emit(LoginStatesSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginStatesFalier(Message: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(LoginStatesFalier(Message: 'email is already'));
      }
    }
    on Exception catch (e) {
      emit(LoginStatesFalier(Message: 'SomeThing went Wrong '));
    }
  }

}