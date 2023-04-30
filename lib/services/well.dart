class Well
{
  String? UWI ;
  String? FIELD;
  String? AREA;
  String? CURRENT_STATUS;
  String? GC;
  String? GC_CONN_DATE;
  String? HEADER;
  String? HEADER_CONN_DATE;
  String? SLOT;
  String? SLOT_CONN_DATE;
  String? LIFT_METHOD;
  String? ALLOWABLE;
  String? OPERATION_STATUS;
  String? OPERATION_STATUS_DATE;
  String? AL_STATUS;
  String? AL_STATUS_DATE;
  String? FACILITY_NAME;
  String? FACILITY_ID;
  String? RESERVOIR_ID;
  String? START_TIME;
  String? END_TIME;
  String? COMPLETION_OBJECTIVE;
  String? WELL_COMPLETION_S;
  String? LAST_UPDATE;
  String? ASSET;
  String? ACTUAL_AREA;



  Well(
      {
        required this.UWI,
        this.FIELD,
        this.AREA,
        this.CURRENT_STATUS,
        this.GC,
        this.GC_CONN_DATE,
        this.HEADER,
        this.HEADER_CONN_DATE,
        this.SLOT,
        this.SLOT_CONN_DATE,
        this.LIFT_METHOD,
        this.ALLOWABLE,
        this.OPERATION_STATUS,
        this.OPERATION_STATUS_DATE,
        this.AL_STATUS,
        this.AL_STATUS_DATE,
        this.FACILITY_NAME,
        this.FACILITY_ID,
        this.RESERVOIR_ID,
        this.START_TIME,
        this.END_TIME,
        this.COMPLETION_OBJECTIVE,
        this.WELL_COMPLETION_S,
        this.LAST_UPDATE,
        this.ASSET,
        this.ACTUAL_AREA

      });

  Well.fromJson(Map<String, dynamic> json) {

    this.UWI = json["UWI"];
    this.FIELD= json["FIELD"];
    this.AREA= json["AREA"];
    this.CURRENT_STATUS= json["CURRENT_STATUS"];
    this.GC = json["GC"];
    this.GC_CONN_DATE = json["GC_CONN_DATE"];
    this.HEADER = json["HEADER"];
    this.HEADER_CONN_DATE = json["HEADER_CONN_DATE"];
    this.SLOT = json["SLOT"];
    this.SLOT_CONN_DATE = json["SLOT_CONN_DATE"];
    this.LIFT_METHOD= json["LIFT_METHOD"];
    this.ALLOWABLE = json["ALLOWABLE"];
    this.OPERATION_STATUS= json["OPERATION_STATUS"];
    this.OPERATION_STATUS_DATE = json["OPERATION_STATUS_DATE"];
    this.AL_STATUS = json["AL_STATUS"];
    this.AL_STATUS_DATE = json["AL_STATUS_DATE"];
    this.FACILITY_NAME = json["FACILITY_NAME"];
    this.FACILITY_ID = json["FACILITY_ID"];
    this.RESERVOIR_ID= json["RESERVOIR_ID"];
    this.START_TIME = json["START_TIME"];
    this.END_TIME = json["END_TIME"];
    this.COMPLETION_OBJECTIVE = json["COMPLETION_OBJECTIVE"];
    this.WELL_COMPLETION_S = json["WELL_COMPLETION_S"];
    this.LAST_UPDATE = json["LAST_UPDATE"];
    this.ASSET = json["ASSET"];
    this.ACTUAL_AREA = json["ACTUAL_AREA"];

  }

}

/*
class Well
{
  String? uwi;
  String? liftMethod;
  String? currentStatus;
  String? opStatus;
  String? welLCompletionS;
  String? area;
  String? feild;
  String? reservoiRId;

  Well(
      { this.uwi,
         this.liftMethod,
         this.currentStatus,
         this.opStatus,
         this.welLCompletionS,
         this.area,
         this.feild,
         this.reservoiRId});

  Well.fromJson(Map<String, dynamic> json) {

        this.uwi = json["uwi"];
        this.liftMethod= json["liftMethod"];
        this.currentStatus= json["currentStatus"];
        this.opStatus= json["opStatus"];
        this.welLCompletionS= json["welL_COMPLETION_S"];
        this.area= json["area"];
        this.feild= json["feild"];
        this.reservoiRId= json["reservoiR_ID"];

  }
}*/
