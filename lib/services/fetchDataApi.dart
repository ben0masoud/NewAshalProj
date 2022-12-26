import 'dart:convert';
import 'dart:async';
import 'package:ashal_ver_3/services/production_facility.dart';
import 'package:ashal_ver_3/services/slot_comp_connection.dart';
import 'package:ashal_ver_3/services/user_info.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellBore.dart';
import 'package:ashal_ver_3/services/wellLatest.dart';
import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/services/well_op_status_reason.dart';
import 'package:ashal_ver_3/services/wirelineActivity.dart';
import 'package:ashal_ver_3/services/wph_test.dart';
//import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;

import 'WellProduction.dart';
import 'gc_comp_connection.dart';
import 'header_comp_connection.dart';



class FetchDataApi{
  String myPath = "https://ashal.kockw.com/api/v1.0/GetTable/";

  //"https://ashalim.kockw.com/test/api/v1.0/GetTable/";

  Future<List<Well>?> fetchWell(String JsonFilter) async {
    print('enter fetchWell fun ');
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/MainForm.json'));

    http.Response response = await http.get(Uri.parse('${myPath}well_completion'+JsonFilter));
    //http.Response response = await http.get(Uri.parse('https://ashal.kockw.com/test/api/v1.0/GetTable/well_completion'+JsonFilter));
    try {
      print('the response is '+response.statusCode.toString());
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Well> wells = [];
        wells.clear();
        for (var item in body) {
          wells.add(Well.fromJson(item));
        }
        print('wells = $wells');
        return wells;
      }
      print(response.statusCode);
      return null;
    }
  catch (e) {
    print('e is ${e.runtimeType} ');
  return null;
  }
  }
  Future<List<WellLatest>?> fetchWellLatest(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}Well_latest_data'+JsonFilter));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<WellLatest> well_latest = [];
      //well_latest.clear();
      for(var item in body) {
        well_latest.add(WellLatest.fromJson(item));
      }
      return well_latest;
    }
    return null;
  }
  Future<List<WellBore>?> fetchWellBore(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/Wellbore.json'));
    http.Response response = await http.get(Uri.parse('${myPath}Wellbore'+JsonFilter));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<WellBore> well_bore = [];
      well_bore.clear();
      for(var item in body) {
        well_bore.add(WellBore.fromJson(item));
      }
      return well_bore;
    }
    return null;
  }
  Future<List<WellProduction>?> fetchWellProduction(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/ProductionHistory.json'));
    http.Response response = await http.get(Uri.parse('${myPath}Production_History'+JsonFilter));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<WellProduction> well_production = [];
      well_production.clear();
      for(var item in body) {
        well_production.add(WellProduction.fromJson(item));
      }
      return well_production;
    }
    return null;
  }

  Future<List<WellTest>?> fetchWellTest(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}Well_Test'+JsonFilter));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<WellTest> well_test = [];
      well_test.clear();
      for(var item in body) {
        well_test.add(WellTest.fromJson(item));
      }
      return well_test;
    }
    return null;
  }

  Future<List<WHPTest>?> fetchWPHTest(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}Well_Test'+JsonFilter));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<WHPTest> wph_test = [];
      wph_test.clear();
      for(var item in body) {
        wph_test.add(WHPTest.fromJson(item));
      }
      return wph_test;
    }
    return null;
  }



  Future<List<WirelineActivity>?> fetchWirelineActivity(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}Wireline_Activity'+JsonFilter));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<WirelineActivity> well_wireline_activity = [];
      well_wireline_activity.clear();
      for(var item in body) {
        well_wireline_activity.add(WirelineActivity.fromJson(item));
      }
      return well_wireline_activity;
    }
    return null;
  }

  Future<List<WellOperationStatus>?> fetchWellOperationStatus(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}Well_Operation_Status'+JsonFilter));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<WellOperationStatus> well_operation_status = [];
      well_operation_status.clear();
      for(var item in body) {
        well_operation_status.add(WellOperationStatus.fromJson(item));
      }
      return well_operation_status;
    }
    return null;
  }

  Future<List<WellOpStatusReason>?> fetchWellOpStatusReason(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}Well_Op_Status_Reason'+JsonFilter));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<WellOpStatusReason> well_op_status_reason = [];
      well_op_status_reason.clear();
      for(var item in body) {
        well_op_status_reason.add(WellOpStatusReason.fromJson(item));
      }
      return well_op_status_reason;
    }
    return null;
  }

   Future<List<GcCompConnection>?> fetchGcCompConnection(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/Wellbore.json'));
    http.Response response = await http.get(Uri.parse('${myPath}Gc_Comp_Connection $JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<GcCompConnection> Gc_comp_connection = [];
      Gc_comp_connection.clear();
      for(var item in body) {
        Gc_comp_connection.add(GcCompConnection.fromJson(item));
      }
      print("value from fetchGcCompConnection = $Gc_comp_connection");
      return Gc_comp_connection;
    }

    return null;
  }

  Future<List<HeaderCompConnection>?> fetchHeaderCompConnection(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/Wellbore.json'));
    http.Response response = await http.get(Uri.parse('${myPath}Header_Comp_Connection $JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<HeaderCompConnection> Header_comp_connection = [];
      Header_comp_connection.clear();
      for(var item in body) {
        Header_comp_connection.add(HeaderCompConnection.fromJson(item));
      }
      return Header_comp_connection;
    }
    return null;
  }

  Future<List<SlotCompConnection>?> fetchSlotCompConnection(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/Wellbore.json'));
    http.Response response = await http.get(Uri.parse('${myPath}Slot_Comp_Connection $JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<SlotCompConnection> Slot_comp_connection = [];
      Slot_comp_connection.clear();
      for(var item in body) {
        Slot_comp_connection.add(SlotCompConnection.fromJson(item));
      }
      return Slot_comp_connection;
    }
    return null;
  }

  Future<List<ProductionFacility>?> fetchProductFacility(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}Production_Facility $JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<ProductionFacility> Production_Facility = [];
      Production_Facility.clear();
      for(var item in body) {
        Production_Facility.add(ProductionFacility.fromJson(item));
      }
      return Production_Facility;
    }
    return null;
  }

  Future<List<ASHAL_ACCESS>?> fetchAshalAccess(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}ASHAL_ACCESS $JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<ASHAL_ACCESS> ashal_access = [];
      ashal_access.clear();
      for(var item in body) {
        ashal_access.add(ASHAL_ACCESS.fromJson(item));
      }
      return ashal_access;
    }
    return null;
  }

  Future<List<UserProfile>?> fetchUserProfile(String JsonFilter) async {
    http.Response response = await http.get(Uri.parse('${myPath}user_profile $JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<UserProfile> user_profile = [];
      user_profile.clear();
      for(var item in body) {
        user_profile.add(UserProfile.fromJson(item));
      }
      return user_profile;
    }
    return null;
  }



}


