import '../services/base_client.dart';
import 'base_controller.dart';

class TestContrller with BaseController {
  String myPath = "https://ashalim.kockw.com/test/api/v1.0/GetTable/";
  void getData(String myPath,String Obj, String Cond) async {
    var response = await BaseClient().get(myPath+Obj, Cond).
    catchError(handleError);
    if(response == null) return;

  }
}