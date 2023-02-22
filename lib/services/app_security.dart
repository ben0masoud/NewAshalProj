/*

import 'dart:io';
import 'package:ashal_ver_3/services/access_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aad_oauth/flutter_aad_oauth.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:ashal_ver_3/services/user_info.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'fetchDataApi.dart';

class AppSecurity{

  late FlutterAadOauth oauth;
  late BuildContext context;
  AppSecurity(this.oauth,this.context);


  UserInfo GetUserInfo(String accessToken){
    Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
    UserInfo _user_info = UserInfo()
                  ..GivenName = decodedToken["given_name"].toString()
                  ..FamilyName = decodedToken["family_name"].toString()
                  ..FullName = decodedToken["name"].toString()
                  ..UserName = decodedToken["unique_name"].toString();

    return _user_info;
  }
  Future<UserPrivilege?> loginWithAD() async {
    String? accessToken;
   // FetchDataApi fetchApi = FetchDataApi();
    //print(context);
    UserInfo user_info = UserInfo();
    UserPrivilege? user_priv;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (await oauth.tokenIsValid()) {
          accessToken = await oauth.getAccessToken();
          //print("login was successfully from checkIsLogged");
          // QuickAlert.show(
          //     context: context,
          //     type: QuickAlertType.success,
          //     text: "login was successfully from checkIsLogged");
         // await Future.delayed(const Duration(milliseconds: 1000));
        } else {



          await oauth.login();
          accessToken = await oauth.getAccessToken();

          String? idToken = await oauth.getIdToken();
          //print("login was successfully from login");
          /*
          QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: "login was successfully from login");
          */
          SnackBar(
            content: Text("login was successfully from login"),

          );
        }
        //await Future.delayed(const Duration(milliseconds: 1000));


        user_info = GetUserInfo(accessToken!);

        AccessInfo access_info = await AccessInfo(accessToken, user_info);
        user_priv = await access_info.get_info();
        //user_priv.success = true;
        //print(user_priv);

      }

        return user_priv;
    } on SocketException catch (_) {
      /*
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: "No Internet access",
       );
       */

      SnackBar(
        content: Text("No Internet access"),

      );

    }



  }

  void logout() async {
    FetchDataApi fetchApi = FetchDataApi();
    //final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    //final SharedPreferences prefs = await _prefs;
    await oauth.logout();
    // Remove data for the 'counter' key.
    //final success = await prefs.remove('id_token');
    //print(await fetchApi.fetchUserLogin('hmmarri'));

    //showMessage("Logged out");
    /*
    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: "Logged out");
     */
    SnackBar(
      content: Text("Logged out"),

    );

  }
}

 */
