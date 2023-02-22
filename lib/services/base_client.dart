import 'dart:async';
import 'dart:convert';
import 'dart:io';

//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'app_axceptions.dart';
import 'body_post_json.dart';

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
  Future<dynamic> post(String baseUrl,dynamic bodyObj,dynamic headerObj) async {
    var uri = Uri.parse(baseUrl);
    var _bodyObj = bodyObj;
    print(jsonEncode(_bodyObj));
    try {
      var response = await http.post(uri,
          headers: {
                     HttpHeaders.contentTypeHeader : "application/json"
                   },
        body: jsonEncode(_bodyObj)
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