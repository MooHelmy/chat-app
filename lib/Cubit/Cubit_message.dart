import 'package:chatt_app/Cubit/Message_states.dart';
import 'package:chatt_app/Model/Mess_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Componenet/context.dart';

class Message_cubit extends Cubit<Message_States>{
  Message_cubit(super.Message_States_Initial);
  CollectionReference Message = FirebaseFirestore.instance.collection('Message');
  void addMessage({required String message,required String email}){

    Message.add({
      messTime:DateTime.now(),
      'message':message,
      'id':email

    });

  }
  void reedMessage(){
    List<Messagee>messagelist=[];
    Message.orderBy(messTime,descending: true).snapshots().listen((event) {
      for(var doc in event.docs){
        messagelist.add(Messagee.fromjson(doc));
      }
    });
    emit(Message_States_success(ListMessagel:messagelist ));
  }
}