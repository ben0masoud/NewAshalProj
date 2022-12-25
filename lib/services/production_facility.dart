class ProductionFacility
{
  String? OPERATOR;
  String? REMARKS;
  String? GC;
  String? DATA_SOURCE;
  String? START_TIME;
  String? END_TIME;
  String? INSERT_USER;
  String? INSERT_DATE;
  String? UPDATE_DATE;
  String? UPDATE_USER;

  ProductionFacility(
      {this.OPERATOR
        ,this.REMARKS
        ,this.GC
        ,this.DATA_SOURCE
        ,this.START_TIME
        ,this.END_TIME
        ,this.INSERT_USER
        ,this.INSERT_DATE
        ,this.UPDATE_DATE
        ,this.UPDATE_USER
       });

  ProductionFacility.fromJson(Map<String, dynamic> json) {
    this.OPERATOR = json["OPERATOR"];
    this.REMARKS = json["REMARKS"];
    this.GC =  json["GC"];
    this.DATA_SOURCE= json["DATA_SOURCE"];
    this.START_TIME= json["START_TIME"];
    this.END_TIME= json["END_TIME"];
    this.INSERT_USER= json["INSERT_USER"];
    this.INSERT_DATE= json["INSERT_DATE"];
    this.UPDATE_DATE = json["UPDATE_DATE"];
    this.UPDATE_USER = json["UPDATE_USER"];

  }

}