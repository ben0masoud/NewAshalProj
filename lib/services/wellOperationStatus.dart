class WellOperationStatus
{
  String? UWI;
  String? START_TIME;
  String? STATUS;
  String? STATUS_REASON;
  String? REMARKS;
  String? OFO_REMARKS;
  String? WELL_COMPLETION_S;
  String? OIL_FIELD_OPERATION_S;
  String? FACILITY_STATUS_S;
  String? INSERT_DATE;
  String? INSERTED_BY;
  String? LAST_UPDATE;
  String? UPDATED_BY;


  WellOperationStatus(
      { this.UWI,
        this.START_TIME,
        this.STATUS,
        this.STATUS_REASON,
        this.REMARKS,
        this.OFO_REMARKS,
        this.WELL_COMPLETION_S,
        this.OIL_FIELD_OPERATION_S,
        this.FACILITY_STATUS_S,
        this.INSERT_DATE,
        this.INSERTED_BY,
        this.LAST_UPDATE,
        this.UPDATED_BY,
      });

  WellOperationStatus.fromJson(Map<String, dynamic> json) {

    this.UWI = json["UWI"];
    this.START_TIME= json["START_TIME"];
    this.STATUS= json["STATUS"];
    this.STATUS_REASON= json["STATUS_REASON"];
    this.REMARKS= json["REMARKS"];
    this.OFO_REMARKS= json["OFO_REMARKS"];
    this.WELL_COMPLETION_S= json["WELL_COMPLETION_S"];
    this.OIL_FIELD_OPERATION_S= json["OIL_FIELD_OPERATION_S"];
    this.WELL_COMPLETION_S= json["WELL_COMPLETION_S"];
    this.FACILITY_STATUS_S= json["FACILITY_STATUS_S"];
    this.INSERT_DATE= json["INSERT_DATE"];
    this.LAST_UPDATE= json["LAST_UPDATE"];
    this.UPDATED_BY= json["UPDATED_BY"];

  }

}