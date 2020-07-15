
class Car {
  int id;
  String regNr;
  int carIcon;


  Car(this.id, this.regNr, this.carIcon);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      "id" : id,
      "regNr" : regNr,
      "carIcon" : carIcon,
    };
    return map;
  }

  Car.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    regNr = map["regNr"];
    carIcon = map["carIcon"];
  }
}