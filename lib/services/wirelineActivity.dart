class WirelineActivity
{
  String? UWI;
  String? ACTIVITY_NAME;
  String? START_TIME;
  String? CONTRACTOR;
  String? STATUS;
  String? REMARKS;
  String? WELL_COMPLETION_S;
  String? LAST_UPDATE;

  WirelineActivity(
      { this.UWI,
        this.ACTIVITY_NAME,
        this.START_TIME,
        this.CONTRACTOR,
        this.STATUS,
        this.REMARKS,
        this.WELL_COMPLETION_S,
        this.LAST_UPDATE});

  WirelineActivity.fromJson(Map<String, dynamic> json) {

    this.UWI = json["UWI"];
    this.ACTIVITY_NAME= json["ACTIVITY_NAME"];
    this.START_TIME= json["START_TIME"];
    this.CONTRACTOR= json["CONTRACTOR"];
    this.STATUS= json["STATUS"];
    this.REMARKS= json["REMARKS"];
    this.WELL_COMPLETION_S= json["WELL_COMPLETION_S"];
    this.LAST_UPDATE= json["LAST_UPDATE"];

  }

}