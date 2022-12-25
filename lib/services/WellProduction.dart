class WellProduction
{
  String? UWI;
  String? FACILITY_TYPE;
  String? FACILITY_ID;
  String? PRODUCTION_DATE;
  String? OIL_VOLUME;
  String? CONDENSATE_VOLUME;
  String? GAS_VOLUME;
  String? WATER_VOLUME;
  String? PRODUCTIVE_DAYS;
  String? WELL_COMPLETION_S;
  String? LAST_UPDATE;

  WellProduction(
      { this.UWI,
        this.FACILITY_TYPE,
        this.FACILITY_ID,
        this.PRODUCTION_DATE,
        this.OIL_VOLUME,
        this.CONDENSATE_VOLUME,
        this.GAS_VOLUME,
        this.WATER_VOLUME,
        this.PRODUCTIVE_DAYS,
        this.WELL_COMPLETION_S,
        this.LAST_UPDATE});

  WellProduction.fromJson(Map<String, dynamic> json) {

    this.UWI = json["UWI"];
    this.FACILITY_TYPE= json["FACILITY_TYPE"];
    this.FACILITY_ID= json["FACILITY_ID"];
    this.PRODUCTION_DATE= json["PRODUCTION_DATE"];
    this.OIL_VOLUME= json["OIL_VOLUME"];
    this.CONDENSATE_VOLUME= json["CONDENSATE_VOLUME"];
    this.GAS_VOLUME= json["GAS_VOLUME"];
    this.WATER_VOLUME= json["WATER_VOLUME"];
    this.PRODUCTIVE_DAYS= json["PRODUCTIVE_DAYS"];
    this.WELL_COMPLETION_S= json["WELL_COMPLETION_S"];
    this.LAST_UPDATE= json["LAST_UPDATE"];

  }

}