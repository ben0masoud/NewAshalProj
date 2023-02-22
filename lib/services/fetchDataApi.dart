//import 'dart:convert';
import 'dart:async';
import '../constant_values.dart';
import '../controller/test_controller.dart';
import 'base_client.dart';
import 'body_post_json.dart';
import 'production_facility.dart';
import 'slot_comp_connection.dart';
import 'user_info.dart';
import 'well.dart';
import 'wellBore.dart';
import 'wellLatest.dart';
import 'wellOperationStatus.dart';
import 'wellTest.dart';
import 'well_op_status_reason.dart';
import 'wirelineActivity.dart';
import 'wph_test.dart';
//import 'package:flutter/services.dart' as rootBundle;
//import 'package:http/http.dart' as http;

import 'WellProduction.dart';
import 'gc_comp_connection.dart';
import 'header_comp_connection.dart';



class FetchDataApi{

  String myPath = ConstantValues.api_get_path_prod;
 // String myPostPath = ConstantValues.api_post_path_test;
 // String myPath = ConstantValues.api_get_path_test;
 String myPostPath = ConstantValues.api_post_path_prod;
  String LogPath = "https://ashal.kockw.com/api/v1.0/";
  String ExecPath = "https://ashal.kockw.com/api/v1.0/DynamicProc";

 // String LogPath = "https://ashalim.kockw.com/test/api/v1.0/";

//  String myPath = "https://ashal.kockw.com/api/v1.0/GetTable/"; //"http://mvcsashlsrv/test/api/v1.0/GetTable/";
//  String LogPath = "https://ashalim.kockw.com/test/api/v1.0/";
 // String myPath = "https://ashal.kockw.com/api/v1.0/GetTable/";
  

  //"https://ashalim.kockw.com/test/api/v1.0/GetTable/";

  final controller = TestContrller();

  Future<List<Well>?> fetchWell(String JsonFilter) async {
    print('enter fetchWell fun ');
    var response = await BaseClient().get('${myPath}well_completion', JsonFilter)  ;
    List<Well> wells = [];
    wells.clear();
    for (var item in response) {
      wells.add(Well.fromJson(item));
    }
    print('wells = $wells');
    return wells;
  }

  Future<List<Well>?> fetchWellPost(BodyPost well_post) async {
    well_post.tableName= 'WELL_COMPLETION';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<Well> wells = [];
    wells.clear();
    for (var item in response) {
      wells.add(Well.fromJson(item));
    }
    //print('wells = $wells');
    return wells;
  }

  Future<List<WellLatest>?> fetchWellLatest(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Well_latest_data', JsonFilter)  ;
    List<WellLatest> well_latest = [];
    well_latest.clear();
    for(var item in response) {
      well_latest.add(WellLatest.fromJson(item));
    }
    return well_latest;
  }

  Future<List<WellLatest>?> fetchWellLatestPost(BodyPost well_post) async {
    well_post.tableName= 'Well_latest_data';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<WellLatest> well_latest = [];
    well_latest.clear();
    for(var item in response) {
      well_latest.add(WellLatest.fromJson(item));
    }
    return well_latest;
  }

  Future<List<WellBore>?> fetchWellBore(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Wellbore', JsonFilter)  ;
    List<WellBore> well_bore = [];
    well_bore.clear();
    for(var item in response) {
      well_bore.add(WellBore.fromJson(item));
    }
    return well_bore;
  }

  Future<List<WellBore>?> fetchWellBorePost(BodyPost well_post) async {
    well_post.tableName= 'Wellbore';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<WellBore> well_bore = [];
    well_bore.clear();
    for(var item in response) {
      well_bore.add(WellBore.fromJson(item));
    }
    return well_bore;
  }

  Future<List<WellProduction>?> fetchWellProduction(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Production_History', JsonFilter)  ;
    List<WellProduction> well_production = [];
    well_production.clear();
    for(var item in response) {
      well_production.add(WellProduction.fromJson(item));
    }
    return well_production;
  }

  Future<List<WellProduction>?> fetchWellProductionPost(BodyPost well_post) async {
    well_post.tableName= 'Production_History';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<WellProduction> well_production = [];
    well_production.clear();
    for(var item in response) {
      well_production.add(WellProduction.fromJson(item));
    }
    return well_production;
  }

  Future<List<WellTest>?> fetchWellTest(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Well_Test', JsonFilter)  ;
    List<WellTest> well_test = [];
    well_test.clear();
    for(var item in response) {
      well_test.add(WellTest.fromJson(item));
    }
    return well_test;
  }

  Future<List<WellTest>?> fetchWellTestPost(BodyPost well_post) async {
    well_post.tableName= 'Well_Test';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<WellTest> well_test = [];
    well_test.clear();
    for(var item in response) {
      well_test.add(WellTest.fromJson(item));
    }
    return well_test;
  }

  Future<List<WHPTest>?> fetchWPHTest(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Well_Test', JsonFilter)  ;
    List<WHPTest> wph_test = [];
    wph_test.clear();
    for(var item in response) {
      wph_test.add(WHPTest.fromJson(item));
    }
    return wph_test;
  }

  Future<List<WHPTest>?> fetchWPHTestPost(BodyPost well_post) async {
    well_post.tableName= 'Well_Test';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<WHPTest> wph_test = [];
    wph_test.clear();
    for(var item in response) {
      wph_test.add(WHPTest.fromJson(item));
    }
    return wph_test;
  }

  Future<List<WirelineActivity>?> fetchWirelineActivity(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Wireline_Activity', JsonFilter);
    List<WirelineActivity> well_wireline_activity = [];
    well_wireline_activity.clear();
    for(var item in response) {
      well_wireline_activity.add(WirelineActivity.fromJson(item));
    }
    return well_wireline_activity;
  }

  Future<List<WirelineActivity>?> fetchWirelineActivityPost(BodyPost well_post) async {
    well_post.tableName= 'Wireline_Activity';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<WirelineActivity> well_wireline_activity = [];
    well_wireline_activity.clear();
    for(var item in response) {
      well_wireline_activity.add(WirelineActivity.fromJson(item));
    }
    return well_wireline_activity;
  }

  Future<List<WellOperationStatus>?> fetchWellOperationStatus(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Well_Operation_Status', JsonFilter);
    List<WellOperationStatus> well_operation_status = [];
    well_operation_status.clear();
    for(var item in response) {
      well_operation_status.add(WellOperationStatus.fromJson(item));
    }
    return well_operation_status;
  }

  Future<List<WellOperationStatus>?> fetchWellOperationStatusPost(BodyPost well_post) async {
    well_post.tableName= 'Well_Operation_Status';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<WellOperationStatus> well_operation_status = [];
    well_operation_status.clear();
    for(var item in response) {
      well_operation_status.add(WellOperationStatus.fromJson(item));
    }
    return well_operation_status;
  }

  Future<List<WellOpStatusReason>?> fetchWellOpStatusReason(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Well_Op_Status_Reason', JsonFilter);
    List<WellOpStatusReason> well_op_status_reason = [];
    well_op_status_reason.clear();
    for(var item in response) {
      well_op_status_reason.add(WellOpStatusReason.fromJson(item));
    }
    return well_op_status_reason;
  }

  Future<List<WellOpStatusReason>?> fetchWellOpStatusReasonPost(BodyPost well_post) async {
    well_post.tableName= 'Well_Op_Status_Reason';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<WellOpStatusReason> well_op_status_reason = [];
    well_op_status_reason.clear();
    for(var item in response) {
      well_op_status_reason.add(WellOpStatusReason.fromJson(item));
    }
    return well_op_status_reason;
  }

  Future PostWellOpStatus(String JsonHeader,String JsonBody) async {

    //final response = await BaseClient().post(ExecPath, "Exe", JsonHeader, JsonBody);
    var response = await controller.postData(ExecPath, JsonBody,'')  ;


   // var response = await BaseClient().get('${myPath}Well_Op_Status_Reason', JsonFilter);
    return response;
  }

   Future<List<GcCompConnection>?> fetchGcCompConnection(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Gc_Comp_Connection', JsonFilter);
    List<GcCompConnection> Gc_comp_connection = [];
    Gc_comp_connection.clear();
    for(var item in response) {
      Gc_comp_connection.add(GcCompConnection.fromJson(item));
    }
    print("value from fetchGcCompConnection = $Gc_comp_connection");
    return Gc_comp_connection;
  }

  Future<List<GcCompConnection>?> fetchGcCompConnectionPost(BodyPost well_post) async {
    well_post.tableName= 'Gc_Comp_Connection';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<GcCompConnection> Gc_comp_connection = [];
    Gc_comp_connection.clear();
    for(var item in response) {
      Gc_comp_connection.add(GcCompConnection.fromJson(item));
    }
    print("value from fetchGcCompConnection = $Gc_comp_connection");
    return Gc_comp_connection;
  }

  Future<List<HeaderCompConnection>?> fetchHeaderCompConnection(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Header_Comp_Connection', JsonFilter);
    List<HeaderCompConnection> Header_comp_connection = [];
    Header_comp_connection.clear();
    for(var item in response) {
      Header_comp_connection.add(HeaderCompConnection.fromJson(item));
    }
    return Header_comp_connection;
  }

  Future<List<HeaderCompConnection>?> fetchHeaderCompConnectionPost(BodyPost well_post) async {
    well_post.tableName= 'Header_Comp_Connection';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<HeaderCompConnection> Header_comp_connection = [];
    Header_comp_connection.clear();
    for(var item in response) {
      Header_comp_connection.add(HeaderCompConnection.fromJson(item));
    }
    return Header_comp_connection;
  }

  Future<List<SlotCompConnection>?> fetchSlotCompConnection(String JsonFilter) async {
    var response = await BaseClient().get('${myPath}Slot_Comp_Connection', JsonFilter);
    List<SlotCompConnection> Slot_comp_connection = [];
    Slot_comp_connection.clear();
    for(var item in response) {
      Slot_comp_connection.add(SlotCompConnection.fromJson(item));
    }
    return Slot_comp_connection;
  }

  Future<List<SlotCompConnection>?> fetchSlotCompConnectionPost(BodyPost well_post) async {
    well_post.tableName= 'Slot_Comp_Connection';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<SlotCompConnection> Slot_comp_connection = [];
    Slot_comp_connection.clear();
    for(var item in response) {
      Slot_comp_connection.add(SlotCompConnection.fromJson(item));
    }
    return Slot_comp_connection;
  }

  Future<List<ProductionFacility>?> fetchProductFacility(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('${myPath}Production_Facility $JsonFilter'));
    var response = await BaseClient().get('${myPath}Production_Facility', JsonFilter);
    List<ProductionFacility> Production_Facility = [];
    Production_Facility.clear();
    for(var item in response) {
      Production_Facility.add(ProductionFacility.fromJson(item));
    }
    return Production_Facility;
  }

  Future<List<ProductionFacility>?> fetchProductFacilityPost(BodyPost well_post) async {
    well_post.tableName= 'Production_Facility';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    List<ProductionFacility> Production_Facility = [];
    Production_Facility.clear();
    for(var item in response) {
      Production_Facility.add(ProductionFacility.fromJson(item));
    }
    return Production_Facility;
  }

  // user_profile = await fetchApi.fetchUserProfile(
  // ":1:USER_ID='${user_info.UserName!.split('@')[0]}'")
  // as List<UserProfile>;
  // ashal_access = await fetchApi.fetchAshalAccess(
  // "::USER_ID='${user_info.UserName!.split('@')[0]}'")
  // as List<ASHAL_ACCESS>;
/*
  {
      'tableName' : 'ASHAL_ACCESS',
      'rowsLimit' : null,
      'selectedFields' : ['uwi', 'well_completion_s', 'activity_name'],
      'filters' : [
          { 'name' : 'USER_ID', 'value' : '2487823' },
          { 'name' : 'activity_name", 'value' : 'PORTABLE' },
          { 'name' : 'start_time', 'value' : '10/24/2021 8:15:00 AM' }
      ],
      'orderBy' : null
  }
*/
  Future<List<ASHAL_ACCESS?>> fetchAshalAccess(String JsonFilter) async {
    var response = await  controller.getData(myPath, 'ASHAL_ACCESS', JsonFilter) ;//BaseClient().get('${myPath}ASHAL_ACCESS', JsonFilter)  ;
    List<ASHAL_ACCESS> ashal_access = [];
    ashal_access.clear();
    if(response != null) {
      for (var item in response) {
        ashal_access.add(ASHAL_ACCESS.fromJson(item));
      }
    }
    return ashal_access;
  }

  Future<List<ASHAL_ACCESS?>> fetchAshalAccessPost(BodyPost well_post) async {
    well_post.tableName= 'ASHAL_ACCESS';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    //var response = await  controller.getData(myPath, 'ASHAL_ACCESS', JsonFilter) ;//BaseClient().get('${myPath}ASHAL_ACCESS', JsonFilter)  ;
    List<ASHAL_ACCESS> ashal_access = [];
    ashal_access.clear();
    if(response != null) {
      for (var item in response) {
        ashal_access.add(ASHAL_ACCESS.fromJson(item));
      }
    }
    return ashal_access;
  }

  Future<List<UserProfile?>> fetchUserProfile(String JsonFilter) async {
    var response = await controller.getData(myPath, 'user_profile', JsonFilter) ;//  .get('${myPath}user_profile', JsonFilter)  ;
    List<UserProfile> user_profile = [];
    user_profile.clear();
    if(response != null) {
      for (var item in response) {
        user_profile.add(UserProfile.fromJson(item));
      }
    }
    return user_profile;
  }

  Future<List<UserProfile?>> fetchUserProfilePost(BodyPost well_post) async {
    well_post.tableName= 'user_profile';
    var response = await controller.postData(myPostPath, well_post.toJson(),'')  ;
    //var response = await controller.getData(myPath, 'user_profile', JsonFilter) ;//  .get('${myPath}user_profile', JsonFilter)  ;
    List<UserProfile> user_profile = [];
    user_profile.clear();
    if(response != null) {
      for (var item in response) {
        user_profile.add(UserProfile.fromJson(item));
      }
    }
    return user_profile;
  }

  Future<dynamic> fetchUserLogin(String JsonFilter) async {
    var response = await controller.getData(LogPath, 'Login', JsonFilter) ;// BaseClient().get('${LogPath}Login/', JsonFilter);
    return response;
  }

  Future<dynamic> fetchUserLoginPost(User user) async {
    //well_post.tableName= 'Login';
    var response = await controller.postData(LogPath+'Login', user.toJson(),'')  ;
  //  var response = await controller.getData(LogPath, 'Login', JsonFilter) ;// BaseClient().get('${LogPath}Login/', JsonFilter);
    return response;
  }

  Future<dynamic> fetchUserLogout(String JsonFilter) async {
    var response = await controller.getData(LogPath, 'Logout', JsonFilter) ;// BaseClient().get('${LogPath}Logout/', JsonFilter);
    return response;
  }

  Future<dynamic> fetchUserLogoutPost(User user) async {
    //well_post.tableName= 'Logout';
    var response = await controller.postData(LogPath+'Login', user.toJson(),'')  ;
  //  var response = await controller.getData(LogPath, 'Logout', JsonFilter) ;// BaseClient().get('${LogPath}Logout/', JsonFilter);
    return response;
  }
  /*void BodyPostJson(String table,String rowsLimit,List<String> Fields,Map<dynamic,dynamic> Filters,String OrderBy){

    {
      'tableName' : table,
    'rowsLimit' : rowsLimit,
    'selectedFields' : Fields,//['uwi', 'well_completion_s', 'activity_name'],
    'filters' : [
    { 'name' : 'USER_ID', 'value' : '2487823' },
    { 'name' : 'activity_name", 'value' : 'PORTABLE' },
    { 'name' : 'start_time', 'value' : '10/24/2021 8:15:00 AM' }
    ],
    'orderBy' : null
    }

  }*/


}


