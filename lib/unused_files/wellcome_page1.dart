/*
import 'package:action_slider/action_slider.dart';
import 'package:ashal_ver_3/services/access_info.dart';
import 'package:ashal_ver_3/services/app_security.dart';
import 'package:ashal_ver_3/services/navigation_service.dart';
import 'package:ashal_ver_3/services/user_info.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_aad_oauth/flutter_aad_oauth.dart';
import 'package:flutter_aad_oauth/model/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant_values.dart';
import 'gc_list_page.dart';
import 'main.dart';



class WelcomePage1 extends StatefulWidget {
  const WelcomePage1({Key? key}) : super(key: key);

  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  static const String TENANT_ID = "e7c58320-6dbf-4137-b708-5142fc7b1e52";
  static const String CLIENT_ID = "20a2b586-3f48-4555-882f-4b5fa090a116";

  late Config config;
  late FlutterAadOauth oauth = FlutterAadOauth(config);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();



  late bool IsOn;
  late bool approve;
  String? UserName='';
  late UserInfo user_info;
  late AppSecurity appSecurity;
  late UserPrivilege usr_priv;
  late List<ASHAL_ACCESS> ashal_access = [];
  late List<UserProfile> user_profile = [];



  /*getPref() async{
    final SharedPreferences prefs = await _prefs;
      UserName = prefs.getString('user_id');
  }
  savePref(String? userId) async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString('user_id',userId!);
  }*/

  @override
  initState() {
    Object redirectUri;
    late String scope;
    late String responseType;



   // getPref();
    if (kIsWeb) {
      scope = "openid profile email offline_access user.read";
      responseType = "id_token+token";
      final currentUri = Uri.base;
      redirectUri = Uri(
        host: currentUri.host,
        scheme: currentUri.scheme,
        port: currentUri.port,
        path: '/authRedirect.html',
      );
    } else {
      scope = "openid profile offline_access";
      //scope = "openid offline_access https%3A%2F%2Fgraph.microsoft.com%2Fuser.read";
      responseType = "code";
      redirectUri = "msauth://com.kockw.ashalim/qYu8bFUMsSRFu7NTRebnOIqHprE=";
    }

    config = Config(
        azureTenantId: TENANT_ID,
        clientId: CLIENT_ID,
        scope: scope,
        redirectUri: '$redirectUri',
        responseType: responseType);

    oauth = FlutterAadOauth(config);
    oauth.setContext(context);
    super.initState();
   // WidgetsBinding.instance.addObserver(this);

    setState(() {
      IsOn = true;
      approve = false;
      user_info = UserInfo();
      usr_priv = UserPrivilege();
      appSecurity = AppSecurity(oauth,context);
      user_info.GivenName = '';
      user_info.FamilyName = '';
      user_info.FullName = '';
      user_info.UserName = '';

    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme:  ThemeData(
       // primarySwatch: ConstantValues.MainColor1,
        useMaterial3: true,

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset('assets/dashboard.json'),
              SizedBox(height: 0.05.sh),
              Center(
                child: (UserName! != '') ? Text('Welcome : ${UserName!}') : Text(''),
              ),
              SizedBox(height: 0.05.sh),
              Center(
                child: ActionSlider.standard(
                  sliderBehavior: SliderBehavior.stretch,
                  rolling: true,
                  width: 300.0,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.green,
                  toggleColor: Colors.amber,
                  iconAlignment: Alignment.centerRight,
                  loadingIcon: SizedBox(
                      width: 50,
                      child: Center(
                          child: SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(
                                strokeWidth: 2.0, color: Colors.black),
                          ))),
                  successIcon: const SizedBox(
                      width: 50,
                      child: Center(child: Icon(Icons.check_rounded))),
                  icon: const SizedBox(
                      width: 50,
                      child: Center(child: Icon(Icons.refresh_rounded))),
                  action: (controller) async {

                    if(IsOn) {
                      controller.loading();
                      approve = await AccessPage(context);
                      if(approve)
                        controller.success();
                       else {
                        controller.reset();
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.info,
                          title: 'Oops...',
                          text: 'User have no profile',
                        );
                      }
                    }
                    //login();
                  },
                ),
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              Center(
                child: (user_info.FullName == 'Al-Marri, Hamad Masoud') ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        Text('AD'),
                        Switch(
                          value: IsOn,
                          activeColor: Colors.red,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              IsOn = value;
                            });
                          },
                        ),
                  ],
                ) : null,
              ),
              SizedBox(
                height: 0.05.sh,
              ),

              Center(
                child:
                //( usr_priv.AccessToken != null) ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Logout'),
                    Switch(
                      value: false,
                      activeColor: Colors.red,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          if (value) {
                            appSecurity.logout();


                                 // await Future.delayed(const Duration(milliseconds: 1000));
                                 // await QuickAlert.show(
                                 //     context: context,
                                 //     type: QuickAlertType.success,
                                 //     text: "${usr_priv.USER_ID} has been Logged out!.");







                          }
                        });
                      },
                    ),
                  ],
                ),// : null,
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<bool> AccessPage(BuildContext context) async {

    usr_priv = (await appSecurity.loginWithAD())!;
    if (usr_priv.PROFILE!.toUpperCase() == 'wellcompletionlist'.toUpperCase()) {
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          settings: RouteSettings(name: "wellcompletionlist"),
          builder: (context) => MyHomePageWithPages(
            title: 'ASHAL',
            user: usr_priv.USER_ID,
            profile: usr_priv.PROFILE!,
            AshalAccess: usr_priv.FORM_GROUP_ID,
            Area: usr_priv.Area,
          )));
      return true;
    } else if (usr_priv.PROFILE!.toUpperCase() == 'gcList'.toUpperCase()) {
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          settings: RouteSettings(name: "gcList"),
          builder: (context) => GcListPages(
            title: 'ASHAL',
            user: usr_priv.USER_ID,
            profile: usr_priv.PROFILE!,
            AshalAccess: usr_priv.FORM_GROUP_ID,
            Area: usr_priv.Area,
          )));
      return true;
    }
    return false;
  }

}

 */
