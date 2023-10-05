import '../Model/Mess_model.dart';

abstract class Message_States {}
class Message_States_Initial extends Message_States {}
class Message_States_success extends Message_States {
List<Messagee>ListMessagel=[];
Message_States_success({required this.ListMessagel});
}