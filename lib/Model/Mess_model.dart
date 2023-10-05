
class Messagee {
   String message;
   String id;
  Messagee( this.message,this.id);
  factory Messagee.fromjson(data){
    return Messagee(data['message'],(data['id']));
  }
}
