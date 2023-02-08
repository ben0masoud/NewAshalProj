import '../services/base_client.dart';
import '../services/body_post_json.dart';
import 'base_controller.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class TestContrller with BaseController {
  String myPath = "https://ashalim.kockw.com/test/api/v1.0/GetTable/";
  Future<dynamic> getData(String myPath,String Obj, String Cond) async {
    var response = await BaseClient().get(myPath+Obj, Cond)
        .catchError(handleError);
    if(response == null)
      return;
    else
      return response;

  }
  Future<dynamic> postData(String myPath,dynamic Body,dynamic Header) async {
    var response = await BaseClient().post(myPath, Body,Header)
        .catchError(handleError);
    if(response == null) return;
    return response;

  }




}