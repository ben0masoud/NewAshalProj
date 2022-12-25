class WellOpStatusReason
{
  String? STATUS_TYPE;
  String? STATUS_CODE;
  String? LEVEL1;
  String? LEVEL2;
  String? STATUS_REASON;
  String? UP_TYPE;
  String? DESCRIPTION;
  String? OPEN_CODE;

  WellOpStatusReason(
      { this.STATUS_TYPE,
        this.STATUS_CODE,
        this.LEVEL1,
        this.LEVEL2,
        this.STATUS_REASON,
        this.UP_TYPE,
        this.DESCRIPTION,
        this.OPEN_CODE
      });

  WellOpStatusReason.fromJson(Map<String, dynamic> json) {

    this.STATUS_TYPE = json["STATUS_TYPE"];
    this.STATUS_CODE= json["STATUS_CODE"];
    this.LEVEL1= json["LEVEL1"];
    this.LEVEL2= json["LEVEL2"];
    this.STATUS_REASON= json["STATUS_REASON"];
    this.UP_TYPE= json["UP_TYPE"];
    this.DESCRIPTION= json["DESCRIPTION"];
    this.OPEN_CODE= json["OPEN_CODE"];

  }
/*
  factory WellOpStatusReason.fromJson(Map<String, dynamic> json) {
    return new WellOpStatusReason(
        STATUS : json["STATUS"],
        STATUS_CODE: json["STATUS_CODE"],
    LEVEL1: json["LEVEL1"],
    LEVEL2: json["LEVEL2"],
    STATUS_REASON: json["STATUS_REASON"],
    UP_TYPE: json["UP_TYPE"],
    DESCRIPTION: json["DESCRIPTION"],
    OPEN_CODE: json["OPEN_CODE"],
    );
  }
*/
}