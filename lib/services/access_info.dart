

import 'package:ashal_ver_3/services/user_info.dart';
import 'package:flutter/material.dart';

import 'fetchDataApi.dart';

class AccessInfo{

  String access_token;
  UserInfo user_info;

  AccessInfo(this.access_token,this.user_info);

  FetchDataApi fetchApi = FetchDataApi();

  Future<UserPrivilege> get_info() async{


    List<ASHAL_ACCESS> ashal_access = [];
    List<UserProfile> user_profile = [];
    late UserPrivilege _usr_priv = UserPrivilege();

    user_profile = await fetchApi.fetchUserProfile(
        ":1:USER_ID='${user_info.UserName!.split('@')[0]}'")
    as List<UserProfile>;
    ashal_access = await fetchApi.fetchAshalAccess(
        "::USER_ID='${user_info.UserName!.split('@')[0]}'")
    as List<ASHAL_ACCESS>;
    print(
        'User : ${user_profile[0].USER_ID}   Profile : ${user_profile[0].PROFILE}   Area : ${ashal_access[0].ASSET}');
    //UserPrivilege user_privilege = UserPrivilege();
    _usr_priv.USER_ID = user_profile[0].USER_ID!;
    _usr_priv.PROFILE = user_profile[0].PROFILE!;
    _usr_priv.Area = ashal_access[0].ASSET!;
    _usr_priv.AccessToken = access_token;
    List<String> lst=[];
    for(int i=0;i<ashal_access.length;i++) {
        lst.add(ashal_access[i].FORM_GROUP_ID!);
    }

    _usr_priv.FORM_GROUP_ID = lst;
    return _usr_priv;

  }


}

class UserPrivilege {
  String? USER_ID;
  String? PROFILE;
  String? Area;
  String? AccessToken;
  List<String>? FORM_GROUP_ID;

  UserPrivilege({this.USER_ID,this.PROFILE,this.Area,this.AccessToken,this.FORM_GROUP_ID});

}