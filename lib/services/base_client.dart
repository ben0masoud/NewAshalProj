import 'dart:async';
import 'dart:convert';
import 'dart:io';

//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'app_axceptions.dart';

class BaseClient
{
  //GET
  Future<dynamic> get(String baseUrl,String api) async {
     var uri = Uri.parse(baseUrl+api);
     try {
       var response = await http.get(uri);
       //print ( _processResponse(response));
       var res = _processResponse(response);
       return res;
     } on SocketException{
       throw FetchDataException('No Internet Connection', uri.toString());
     }
     on TimeoutException{
       throw ApiNotRespondingException('API not responded in time', uri.toString());
     }
  }
  //POST
  Future<dynamic> post(String baseUrl,String api,dynamic headerObj ,dynamic bodyObj) async {
    var uri = Uri.parse(baseUrl+api);
    var _bodyObj = bodyObj;
    print(_bodyObj);
    try {
      var response = await http.post(uri,
          headers: {
                     HttpHeaders.contentTypeHeader : "application/json"
                   },
          // body: jsonEncode(<String,String>
          //   {
          //     'proc_name' : 'InsertOperationStatus',
          //     'v_status'  : '',
          //     'WELL_COMPLETION_S' : '2566730',
          //     'start_time' : '29-May-2022 10:00:00 AM',
          //     'status' : 'OPEN',
          //     'STATUS_REASON' : 'Test from API',
          //     'remarks' : 'testing',
          //     'ofo_remarks' : '',
          //     'insert_date' : '29-May-2022 10:00:00 AM',
          //     'inserted_by' : 'ALMARRI'
          //
          // })
        body: _bodyObj
      );
      return _processResponse(response);
    } on SocketException{throw FetchDataException('No Internet Connection', uri.toString());}
    on TimeoutException{
      throw ApiNotRespondingException('API not responded in time', uri.toString());
    }
  }


  dynamic _processResponse(http.Response response) {

    switch(response.statusCode){
      case 200:
          var responseJson = jsonDecode(response.body);//utf8.decode(response.bodyBytes);
          return responseJson;
        break;
      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes),response.request!.url.toString());
      case 401:
      case 403:
      throw UnAuthorizedException(utf8.decode(response.bodyBytes),response.request!.url.toString());
      case 500:
      default:
      throw FetchDataException('Error occured with code : ${response.statusCode}',response.request!.url.toString());
    }
  }


}