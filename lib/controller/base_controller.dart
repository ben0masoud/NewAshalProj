
import 'package:ashal_ver_3/helper/dialog_helper.dart';
import 'package:ashal_ver_3/services/app_axceptions.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../services/navigation_service.dart';

class BaseController {
 // BuildContext context;
  //BaseController(this.context);
  void handleError(error) {

    if(error is BadRequestException) {
      //BuildContext? context;
      //context =NavigationService.navigatorKey.currentContext;
      // var message = error.message;
      // DialogHelper.ShowErrorDialog(description: message);
       QuickAlert.show(
         context: NavigationService.navigatorKey.currentContext!,
         type: QuickAlertType.error,
         title: 'Oops...',
         text: error.message,
       );
    } else if (error is FetchDataException) {
     // var message = error.message;
      //DialogHelper.ShowErrorDialog(description: message);
      QuickAlert.show(
        context: NavigationService.navigatorKey.currentContext!,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: error.message,
      );
    } else if (error is ApiNotRespondingException){
      //DialogHelper.ShowErrorDialog(description: 'Opps! it took longer to respond.');
      QuickAlert.show(
        context: NavigationService.navigatorKey.currentContext!,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: error.message,
      );
    }
  }


}