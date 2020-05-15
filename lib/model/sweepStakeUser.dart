class SweepStakeUser{

  String winner1,winner2,winner3,winner4,winner5,winner6,winner7,winner8,winner9,winner10;


  Map<String,dynamic> toMap(){
    return{
      'winner1' : winner1,
      'winner2' : winner2,
      'winner3' : winner3,
      'winner4' : winner4,
      'winner5' : winner5,
      'winner6' : winner6,
      'winner7' : winner7,
      'winner8' : winner8,
      'winner9' : winner9,
      'winner10' : winner10,
    };
  }

  SweepStakeUser.fromMap(Map<String,dynamic>map):
        winner1=map['winner1'],
        winner2=map['winner2'],
        winner3=map['winner3'],
        winner4=map['winner4'],
        winner5=map['winner5'],
        winner6=map['winner6'],
        winner7=map['winner7'],
        winner8=map['winner8'],
        winner9=map['winner9'],
        winner10=map['winner10'];

  @override
  String toString() {
    return 'SweepStakeUser{winner1: $winner1, winner2: $winner2, winner3: $winner3, winner4: $winner4, winner5: $winner5, winner6: $winner6, winner7: $winner7, winner8: $winner8, winner9: $winner9, winner10: $winner10}';
  }


}