class WellBore
{
  String? UWI;
  String? SPUD_DATE;
  String? COMP_DATE;
  String? DRILLERS_TD;
  String? GROUND_ELEVATION;
  String? ELEVATION;
  String? ELEVATION_REF;
  String? LATITODE;
  String? LONGITUDE;
  String? LAST_UPDATE;


  WellBore(
      { this.UWI,
        this.SPUD_DATE,
        this.COMP_DATE,
        this.DRILLERS_TD,
        this.GROUND_ELEVATION,
        this.ELEVATION,
        this.ELEVATION_REF,
        this.LATITODE,
        this.LONGITUDE,
        this.LAST_UPDATE});

  WellBore.fromJson(Map<String, dynamic> json) {

    this.UWI = json["UWI"];
    this.SPUD_DATE= json["SPUD_DATE"];
    this.COMP_DATE= json["COMP_DATE"];
    this.DRILLERS_TD= json["DRILLERS_TD"];
    this.GROUND_ELEVATION= json["GROUND_ELEVATION"];
    this.ELEVATION= json["ELEVATION"];
    this.ELEVATION_REF= json["ELEVATION_REF"];
    this.LATITODE = json["LATITODE"];
    this.LONGITUDE = json["LONGITUDE"];
    this.LAST_UPDATE= json["LAST_UPDATE"];

  }

}