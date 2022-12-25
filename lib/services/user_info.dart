class ASHAL_ACCESS
{
  String? USER_ID;
  String? ASSET;
  String? RECORD_STATUS;
  String? FORM_GROUP_ID;
  String? INSERT_DATE;
  String? LAST_UPDATE;
  String? INSERTED_BY;
  String? UPDATED_BY;



  ASHAL_ACCESS(
      { this.USER_ID,
        this.ASSET,
        this.RECORD_STATUS,
        this.FORM_GROUP_ID,
        this.INSERT_DATE,
        this.LAST_UPDATE,
        this.INSERTED_BY,
        this.UPDATED_BY});

  ASHAL_ACCESS.fromJson(Map<String, dynamic> json) {

    this.USER_ID = json["USER_ID"];
    this.ASSET= json["ASSET"];
    this.RECORD_STATUS= json["RECORD_STATUS"];
    this.FORM_GROUP_ID= json["FORM_GROUP_ID"];
    this.INSERT_DATE= json["INSERT_DATE"];
    this.LAST_UPDATE= json["LAST_UPDATE"];
    this.INSERTED_BY= json["INSERTED_BY"];
    this.UPDATED_BY = json["UPDATED_BY"];

  }

}

class UserProfile
{
  String? USER_ID;
  String? PROFILE;

  UserProfile(
      { this.USER_ID,
        this.PROFILE});

  UserProfile.fromJson(Map<String, dynamic> json) {

    this.USER_ID = json["USER_ID"];
    this.PROFILE= json["PROFILE"];

  }

}

class UserInfo
{
  String? GivenName;
  String? FamilyName;
  String? FullName;
  String? UserName;

  UserInfo(
      { this.GivenName,
        this.FamilyName,
        this.FullName,
        this.UserName});
}

