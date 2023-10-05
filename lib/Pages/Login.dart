import 'package:chatt_app/Cubit/Cubita.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Componenet/Button_.dart';
import '../Componenet/Texte_field.dart';
import '../Componenet/context.dart';
import 'package:chatt_app/Pages/Register_page.dart';

import '../Cubit/Cubit_Sataes.dart';
import '../Cubit/Cubit_message.dart';
import 'Chat_Page.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  static String id = 'Login page';
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  String? email,password;
  bool isloadeing=false;
  GlobalKey<FormState>formstate=GlobalKey();
  Widget build(BuildContext context) {
    return BlocConsumer(


        listener: (context, state) {
        if(state is LoginStatesLoding)
          {
            isloadeing=true;
          }else if(state is LoginStatesSuccess ){
          isloadeing=false;
          BlocProvider.of<Message_cubit>(context).reedMessage();
          Navigator.pushNamed(context, Chat_page.id,arguments: email);
        }else if(state is LoginStatesFalier)

          {
            isloadeing=false;
            ShowSnack(context, state.Message!);
          }
      },
      builder:(context, state) =>  ModalProgressHUD(
        inAsyncCall: isloadeing,
        child: Scaffold(
          backgroundColor: Kprimary_color,
          appBar: AppBar(
            title: Text(
              'Login Page',
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
                      name: 'Login',
                      ontap: () async {

                        if (formstate.currentState!.validate()) {
                        BlocProvider.of<Login_cubit>(context).FireAuth(email: email!, password: password!);


                      }}),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      children: [
                        Text(
                          'dont  have acount ?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Resiter.id);
                          },
                          child:
                          Text('  Register', style: TextStyle(color: Colors.white)),
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
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
