abstract class LoginStates{}
 class LoginStatesIntial extends LoginStates{}
 class LoginStatesLoding extends LoginStates{}
 class LoginStatesSuccess extends LoginStates{}
 class LoginStatesFalier extends LoginStates{
 String? Message;
 LoginStatesFalier({required this.Message});
 }
