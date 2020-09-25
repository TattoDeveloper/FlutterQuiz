class StateModel{
  String _name;
  String _capital;

  StateModel.fromMap(Map data){
    _name = data['name'];
    _capital = data['capital'];
  }

  bool testCapital(String capital){
     if(capital == _capital){
       return true;
     }
     return false;
  }
  String get name => _name;
  String get capital => _capital;
}