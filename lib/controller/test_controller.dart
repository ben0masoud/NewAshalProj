import '../services/base_client.dart';
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
  void postData(String myPath,String Obj, String Cond) async {
    var response = await BaseClient().get(myPath+Obj, Cond)
        .catchError(handleError);
    if(response == null) return;

  }




}