
import 'package:ashal_ver_3/helper/dialog_helper.dart';
import 'package:ashal_ver_3/services/app_axceptions.dart';

class BaseController {

  void handleError(error) {

    if(error is BadRequestException) {
       var message = error.message;
       DialogHelper.ShowErrorDialog(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.ShowErrorDialog(description: message);
    } else if (error is ApiNotRespondingException){
      DialogHelper.ShowErrorDialog(description: 'Opps! it took longer to respond.');
    }
  }


}