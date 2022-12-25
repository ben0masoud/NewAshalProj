class GcCompConnection
{
  String? GC;
  String? UWI;
  String? FACILITY_TYPE;
  String? STRING_NAME;
  String? FACILITY_ID;
  String? ACTIVITY_ID;
  String? START_TIME;
  String? END_TIME;
  String? PORT_CONNECTION_S;
  String? GC_SURFACE_FACILITY_S;
  String? WELL_COMPLETION_S;
  String? STRING_S;
  String? INSERT_DATE;
  String? INSERTED_BY;
  String? LAST_UPDATE;
  String? UPDATED_BY;
  String? ID;


  GcCompConnection(
      {this.GC
      ,this.UWI
      ,this.FACILITY_TYPE
      ,this.STRING_NAME
      ,this.FACILITY_ID
      ,this.ACTIVITY_ID
      ,this.START_TIME
      ,this.END_TIME
      ,this.PORT_CONNECTION_S
      ,this.GC_SURFACE_FACILITY_S
      ,this.WELL_COMPLETION_S
      ,this.STRING_S
      ,this.INSERT_DATE
      ,this.INSERTED_BY
      ,this.LAST_UPDATE
      ,this.UPDATED_BY
      ,this.ID});

  GcCompConnection.fromJson(Map<String, dynamic> json) {
    this.GC =  json["GC"];
    this.UWI = json["UWI"];
    this.FACILITY_TYPE= json["FACILITY_TYPE"];
    this.STRING_NAME= json["STRING_NAME"];
    this.FACILITY_ID= json["FACILITY_ID"];
    this.ACTIVITY_ID= json["ACTIVITY_ID"];
    this.START_TIME= json["START_TIME"];
    this.END_TIME = json["END_TIME"];
    this.PORT_CONNECTION_S = json["PORT_CONNECTION_S"];
    this.GC_SURFACE_FACILITY_S= json["GC_SURFACE_FACILITY_S"];
    this.WELL_COMPLETION_S = json["WELL_COMPLETION_S"];
    this.STRING_S= json["STRING_S"];
    this.INSERT_DATE= json["INSERT_DATE"];
    this.INSERTED_BY= json["INSERTED_BY"];
    this.LAST_UPDATE= json["LAST_UPDATE"];
    this.UPDATED_BY= json["UPDATED_BY"];
    this.ID= json["ID"];

  }

}