import 'package:chatt_app/Cubit/Cubit_message.dart';
import 'package:chatt_app/Cubit/Cubita.dart';
import 'package:chatt_app/Cubit/Register_cubit.dart';
import 'package:chatt_app/Pages/Chat_Page.dart';
import 'package:chatt_app/Pages/Register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/Cubit_Sataes.dart';
import 'Cubit/Message_states.dart';
import 'firebase_options.dart';
import 'Pages/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Login_cubit(LoginStatesIntial()),),
          BlocProvider(create: (context) => Register_cubit(LoginStatesIntial()),),
          BlocProvider(create: (context) => Message_cubit(Message_States_Initial()),)
        ],
        child: MaterialApp(
          routes: {
           Chat_page.id:(context) => Chat_page(),
            Login.id: (context) => Login(),
            Resiter.id: (context) => Resiter(),
          },

          home: Login(),
          debugShowCheckedModeBanner: false,
        ),
      );

  }
}
