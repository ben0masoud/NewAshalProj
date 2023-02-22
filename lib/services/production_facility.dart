class ProductionFacility
{
  String? NAME;
  String? OPERATOR;
  String? REMARKS;
  String? GC;
  String? DATA_SOURCE;
  String? START_DATE;
  String? END_DATE;
  String? INSERT_USER;
  String? INSERT_DATE;
  String? UPDATE_DATE;
  String? UPDATE_USER;
  String? ID;
  String? ASSET;
  String? ACTUAL_AREA;
  String? AREA;

  ProductionFacility(
      {this.NAME
        ,this.OPERATOR
        ,this.REMARKS
        ,this.GC
        ,this.DATA_SOURCE
        ,this.START_DATE
        ,this.END_DATE
        ,this.INSERT_USER
        ,this.INSERT_DATE
        ,this.UPDATE_DATE
        ,this.UPDATE_USER
        ,this.ID
        ,this.ASSET
        ,this.ACTUAL_AREA
        ,this.AREA
       });

  ProductionFacility.fromJson(Map<String, dynamic> json) {
    this.NAME = json["NAME"];
    this.OPERATOR = json["OPERATOR"];
    this.REMARKS = json["REMARKS"];
    this.GC =  json["GC"];
    this.DATA_SOURCE= json["DATA_SOURCE"];
    this.START_DATE= json["START_DATE"];
    this.END_DATE= json["END_DATE"];
    this.INSERT_USER= json["INSERT_USER"];
    this.INSERT_DATE= json["INSERT_DATE"];
    this.UPDATE_DATE = json["UPDATE_DATE"];
    this.UPDATE_USER = json["UPDATE_USER"];
    this.ID = json["ID"];
    this.ASSET = json["ASSET"];
    this.ACTUAL_AREA = json["ACTUAL_AREA"];
    this.AREA = json["AREA"];

  }

}