import 'dart:ffi';

import 'package:chatt_app/Cubit/Cubit_Sataes.dart';
import 'package:chatt_app/Cubit/Register_cubit.dart';
import 'package:chatt_app/Pages/Chat_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Componenet/Button_.dart';
import '../Componenet/Texte_field.dart';
import '../Componenet/context.dart';

// ignore: must_be_immutable
class Resiter extends StatelessWidget {

  String? email, password;
  bool isloadeing=false;
  static String id = 'Register page';
GlobalKey<FormState>formstate=GlobalKey();

  Widget build(BuildContext context) {

    return BlocConsumer(
      listener: (context, state) {
        if(state is LoginStatesLoding)
          {
            isloadeing=true;
          }else if(state is LoginStatesSuccess){
          isloadeing=false;
          Navigator.pushNamed(context, Chat_page.id,arguments: email);
        }
        else if(state is LoginStatesFalier)
          {
            ShowSnack(context, state.Message!);
            isloadeing=false;
          }
      },
      builder:(context, state) =>  ModalProgressHUD(
        inAsyncCall: isloadeing,
        child: Scaffold(
          backgroundColor: Kprimary_color,
          appBar: AppBar(
            title: Text(
              'Register Page',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formstate,
              child: ListView(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                      height: 160, child: Image.asset('asset/images/scholar.png')),
                  Center(
                    child: Text(
                      'Scholar Chat',
                      style: TextStyle(
                          fontSize: 34, fontFamily: 'Pacifico', color: Colors.white),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Pacifico',
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Compon_text(
                      hinte: 'Email',
                      onchange: (data) {
                        email = data;
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Compon_text(obscureText: true,
                      hinte: 'Password',
                      onchange: (data) {
                        password = data;
                      }),
                  SizedBox(
                    height: 20,
                  ),

                  Compon_Button(
                      name: 'Register',
                      ontap: () async {

                        if (formstate.currentState!.validate()) {

                          BlocProvider.of<Register_cubit>(context).FireAuthRegister(email: email!, password: password!);
                        }


                      }),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      children: [
                        Text(
                          'allarady have acount ?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:
                              Text('  Login', style: TextStyle(color: Colors.white)),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> ShowSnack(BuildContext context,String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)));
  }

  Future<void> FireAuth() async {
     UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email!, password: password!);
  }
}
