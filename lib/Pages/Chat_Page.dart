import 'package:chatt_app/Componenet/Chat_Bubble.dart';
import 'package:chatt_app/Componenet/context.dart';
import 'package:chatt_app/Cubit/Cubit_message.dart';
import 'package:chatt_app/Cubit/Message_states.dart';
import 'package:chatt_app/Model/Mess_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Chat_page extends StatelessWidget {
  @override
  static String id ='Chat_page';
  List<Messagee>messagelist=[];
  TextEditingController controller=TextEditingController();
  final _controller=ScrollController();
  CollectionReference Message = FirebaseFirestore.instance.collection('Message');
  Widget build(BuildContext context) {
    String emaiil=   ModalRoute.of(context)!.settings.arguments as String;
            return Scaffold(

              appBar: AppBar(


                backgroundColor: Kprimary_color,
                title: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('asset/images/scholar.png', height: 50),
                      Text(
                        'Chat',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),

                ),
              ),
              body: Column(
                children: [
                  Expanded(

                    child: BlocConsumer(
                      listener: (context, state) {
                        if(state is Message_States_success){

                          messagelist=  state.ListMessagel;
                        }
                      },
                      builder: (context, state) {
                        return ListView.builder(

                          reverse:true ,
                          controller:_controller ,

                          itemCount: messagelist.length,
                          itemBuilder: (context, index) {
                            return  messagelist[index].id==emaiil ?  ChatBappule(messagee: messagelist[index])
                                :ChatBappuleforFrend(messagee: messagelist[index]);
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data){
                        BlocProvider.of<Message_cubit>(context).addMessage(message: data,  email: emaiil);
                        _controller.animateTo(0, duration: Duration(seconds: 10), curve: Curves.easeIn);

                      },

                      decoration: InputDecoration(

                          suffixIcon: Icon(
                            Icons.send,
                            color: Kprimary_color,
                          ),
                          hintText: 'Send message',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  30))),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          )),
                    ),
                  ),
                ],
              ),
            );
          }

        }





