
class SavedCars {
  int id;
  String regNr;
  int icon;
  String inspectionDate;

  SavedCars(this.id, this.regNr, this.icon, this.inspectionDate);

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "regNr" : regNr,
      "icon" : icon,
      "inspectionDate" : inspectionDate,
    };
  }

  SavedCars.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    regNr = map["regNr"];
    icon = map["icon"];
    inspectionDate = map["inspectionDate"];
  }

}