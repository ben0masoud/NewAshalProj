class WellTest{
  String? UWI;
  String? ACTIVITY_TYPE;
  String? ACTIVITY_NAME;
  String? ACTIVITY_ID;
  String? FACILITY_NAME;
  String? FACILITY_ID;
  String? START_TIME;
  String? END_TIME;
  String? DURATION;
  String? LEFT_CHOKE_SIZE;
  String? RIGHT_CHOKE_SIZE;
  String? LIQUID_RATE;
  String? PREFFERED_FLAG;
  String? WHP;
  String? FLOW_LINE_PRESSURE;
  String? PRESSURE_FLAG;
  String? WC;
  String? WC_FLAG;
  String? TOTAL_GOR;
  String? GOR_FLAG;
  String? WELL_COMPLETION_S;
  String? VALIDATE_DATE;
  String? VALIDATED_BY;
  String? LAST_UPDATE;

  WellTest({
    this.UWI,
    this.ACTIVITY_TYPE,
    this.ACTIVITY_NAME,
    this.ACTIVITY_ID,
    this.FACILITY_NAME,
    this.FACILITY_ID,
    this.START_TIME,
    this.END_TIME,
    this.DURATION,
    this.LEFT_CHOKE_SIZE,
    this.RIGHT_CHOKE_SIZE,
    this.LIQUID_RATE,
    this.PREFFERED_FLAG,
    this.WHP,
    this.FLOW_LINE_PRESSURE,
    this.PRESSURE_FLAG,
    this.WC,
    this.WC_FLAG,
    this.TOTAL_GOR,
    this.GOR_FLAG,
    this.WELL_COMPLETION_S,
    this.VALIDATE_DATE,
    this.VALIDATED_BY,
    this.LAST_UPDATE,
  });

  WellTest.fromJson(Map<String, dynamic> json) {
    UWI= json["UWI"];
    ACTIVITY_TYPE= json["ACTIVITY_TYPE"];
    ACTIVITY_NAME= json["ACTIVITY_NAME"];
    ACTIVITY_ID= json["ACTIVITY_ID"];
    FACILITY_NAME= json["FACILITY_NAME"];
    FACILITY_ID= json["FACILITY_ID"];
    START_TIME= json["START_TIME"];
    END_TIME= json["END_TIME"];
    DURATION= json["DURATION"];
    LEFT_CHOKE_SIZE= json["LEFT_CHOKE_SIZE"];
    RIGHT_CHOKE_SIZE= json["RIGHT_CHOKE_SIZE"];
    LIQUID_RATE = json["LIQUID_RATE"];
    PREFFERED_FLAG= json["PREFFERED_FLAG"];
    WHP= json["WHP"];
    FLOW_LINE_PRESSURE= json["FLOW_LINE_PRESSURE"];
    PRESSURE_FLAG= json["PRESSURE_FLAG"];
    WC= json["WC"];
    WC_FLAG= json["WC_FLAG"];
    TOTAL_GOR = json["TOTAL_GOR"];
    GOR_FLAG= json["GOR_FLAG"];
    WELL_COMPLETION_S= json["WELL_COMPLETION_S"];
    VALIDATE_DATE= json["VALIDATE_DATE"];
    VALIDATED_BY= json["VALIDATED_BY"];
    LAST_UPDATE= json["LAST_UPDATE"];
  }

}