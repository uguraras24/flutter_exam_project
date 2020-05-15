class Exams{

  String answers,description,enabled,examname,tarih,time;


  Map<String,dynamic> toMap(){
    return{
      'answers' : answers,
      'description' : description,
      'enabled' : enabled,
      'examname' : examname,
      'tarih' : tarih,
      'time' : time,
    };
  }

  Exams.fromMap(Map<String,dynamic>map):
        answers=map['answers'],
        description=map['description'],
        enabled=map['enabled'],
        examname=map['examname'],
        tarih=map['tarih'],
        time=map['time'];

  @override
  String toString() {
    return 'Exams{answers: $answers, description: $description, enabled: $enabled, examname: $examname, tarih: $tarih, time: $time}';
  }


}