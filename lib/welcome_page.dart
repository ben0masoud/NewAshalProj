import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/user_info.dart';
import 'package:flutter_aad_oauth/flutter_aad_oauth.dart';
import 'package:flutter_aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quiver/async.dart';
//import 'package:rolling_switch/rolling_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:action_slider/action_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';
import 'gc_list_page.dart';
//import 'main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with WidgetsBindingObserver {
  static const String TENANT_ID = "e7c58320-6dbf-4137-b708-5142fc7b1e52";
  static const String CLIENT_ID = "20a2b586-3f48-4555-882f-4b5fa090a116";

  late Config config;
  late FlutterAadOauth oauth = FlutterAadOauth(config);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  CountdownTimer? _countdownTimer;
  late bool IsOn;
  String? UserName='';
  late UserInfo user_info;
  late List<ASHAL_ACCESS> ashal_access = [];
  late List<UserProfile> user_profile = [];

  @override
  initState() {
    Object redirectUri;
    late String scope;
    late String responseType;

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
      redirectUri = "msauth://com.kockw.ashal/qYu8bFUMsSRFu7NTRebnOIqHprE=";
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
    WidgetsBinding.instance.addObserver(this);
    get_access_info() ;
    setState(() {
      IsOn = false;
      user_info = UserInfo();
      user_info.GivenName = 'hamad';
      user_info.FamilyName = 'almarri';
      user_info.FullName = 'hamad masoud almarri';
      user_info.UserName = 'hmmarri@kockw.com';

    });
  }


  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    //UserName = get_access_info();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
          /*
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RollingSwitch.icon(
                onChanged: (bool state) {
                  print('turned ${(state) ? 'on' : 'off'}');
                  setState(() {
                    IsOn=state;
                  });
                  print('turned ${(IsOn) ? 'on' : 'off'}');

                },
                rollingInfoRight: const RollingIconInfo(
                  icon: Icons.power_settings_new_rounded,
                  text: Text('On'),
                ),
                rollingInfoLeft: const RollingIconInfo(
                  icon: Icons.power_settings_new_rounded,
                  backgroundColor: Colors.grey,
                  text: Text('Off'),
                ),
              ),
            )
          ],
          */
        ),
        body: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset('assets/dashboard.json'),
              /* SizedBox(height: 0.25.sh),
              Container(
                //color: Colors.red,
                child: Center(
                    child:Text(
                      'ASHAL',
                      style: TextStyle(
                        fontSize: 50.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                ),
              ),
              (checkIsLogged() == true) ?  Text(UserName!) :  Text(""),
*/
              SizedBox(height: 0.05.sh),
              Center(
                child: Text(UserName!),
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
                    login();
                    //  setState(() {
/*
                    if(IsOn)
                    {
                      setState(() {
                        if(checkIsLogged() == false) {
                          login();
                        }
                      });

                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          settings: RouteSettings(name: "Home"),
                          builder: (context) =>
                              MyHomePageWithPages(
                                title: 'Flutter Demo Home Page',
                                profile: 'wellcompletionlist',
                                AshalAccess: 'ALL AREA',))
                      );
                    }
*/
                    // });

                    //   controller.loading(); //starts loading animation
                    //   await Future.delayed(const Duration(seconds: 3));
                    //   controller.success(); //starts success animation
                    //   await Future.delayed(const Duration(seconds: 1));
                    //   controller.reset(); //resets the slider
                  },
                ),
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              Center(
                child: Row(
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
                ),
              ),
              SizedBox(
                height: 0.05.sh,
              ),
              Center(
                child: Row(
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
                                logout();
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Container(
                    child: Center(
                      child:  ElevatedButton(
                      child: Text('Login',style: TextStyle(fontSize: 35.sp),),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(0.05.sw, 0.004.sh),
                        primary: Colors.white,
                        side: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {

                        if(IsOn)
                        {
                          setState(() {
                            if(checkIsLogged() == false) {
                              login();
                            }
                          });



                        } else
                        {
                          Navigator.of(context).push(MaterialPageRoute(
                              settings: RouteSettings(name: "Home"),
                              builder: (context)=>MyHomePage(title: 'Flutter Demo Home Page'))
                          );
                        }

                      },
                    ),
                    ),
                  ),

                  SizedBox(width: 0.05.sw,),

                  Container(
                    child: Center(child:  ElevatedButton(
                      child: Text("Logout",style: TextStyle(fontSize: 35.sp),),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(0.05.sw, 0.002.sh),
                        primary: Colors.white,
                        side: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {

                        logout();

                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Flutter Demo Home Page')));
                      },
                    ),
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    print("AppLifecycleState :::: $state");
    if (state == AppLifecycleState.paused) {
      _countdownTimer =
          CountdownTimer(Duration(seconds: 5), Duration(seconds: 1));
    } else if (state == AppLifecycleState.resumed) {
      if (_countdownTimer!.remaining > Duration(seconds: 0)) {
        print("AppLifecycleState timer didn't complete");
      } else {
        showMessage("Logout, AppLifecycleState timeout");
        print("AppLifecycleState timeout");
      }
      _countdownTimer!.cancel();
    }
  }

  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = AlertDialog(content: Text(text), actions: <Widget>[
      new ElevatedButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void get_access_info() async {

    final SharedPreferences prefs = await _prefs;
    String? _userName = prefs.getString('user_name') ?? "Login";
    String? id_token = prefs.getString('id_token') ?? "";

   // try {

      if(IsOn) {
        if ((id_token == "") || (id_token == null)) {
          id_token = await oauth.getAccessToken();
          prefs.setString('id_token', id_token!);
          Map<String, dynamic> decodedToken = JwtDecoder.decode(id_token!);
          _userName = decodedToken["name"].toString();
          prefs.setString('user_name', _userName);
        } else {
          print('is Expire : ' + JwtDecoder.isExpired(id_token).toString());
          print(JwtDecoder
              .getTokenTime(id_token)
              .inHours);
          print(JwtDecoder
              .getTokenTime(id_token)
              .inDays);
          if (JwtDecoder
              .getTokenTime(id_token)
              .inDays > 0) {
            final success = await prefs.remove('id_token');
            setState(() {
              _userName = "";
            });
            print('remove token successfully');
          }
        }
      }
      setState(() {
        //isTokenExpired = JwtDecoder.isExpired(id_token!);
        UserName = _userName;
      });

  //  } catch (e) {
  //    showError(e);
  //  }
  }

  Future<bool?> checkIsLogged() async {
    FetchDataApi fetchApi = FetchDataApi();
    if (await oauth.tokenIsValid()) {
      String? accessToken = await oauth.getAccessToken();
      //showMessage("Access token: $accessToken");
      print("login was successfully from checkIsLogged");
      user_info = get_login_info(accessToken)!;
      //print(user_info.UserName?.split('@')[0]);

      user_profile = await fetchApi.fetchUserProfile(
              ":1:USER_ID='${user_info.UserName!.split('@')[0]}'")
          as List<UserProfile>;
      ashal_access = await fetchApi.fetchAshalAccess(
              ":1:USER_ID='${user_info.UserName!.split('@')[0]}'")
          as List<ASHAL_ACCESS>;
      print(
          'User : ${user_profile[0].USER_ID}   Profile : ${user_profile[0].PROFILE}   Area : ${ashal_access[0].ASSET}');

      if (user_profile == 'wellcompletionlist') {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            settings: RouteSettings(name: "Home"),
            builder: (context) => MyHomePageWithPages(
                  title: 'ASHAL',
                  profile: user_profile[0].PROFILE!,
                  AshalAccess: ashal_access[0].ASSET,
                )));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            settings: RouteSettings(name: "GcLists"),
            builder: (context) => GcListPages(
                  title: 'ASHAL',
                  profile: user_profile[0].PROFILE!,
                  AshalAccess: ashal_access[0].ASSET,
                )));
      }
      return true;
    }

    return false;
  }

/*
  void login() async {
    FetchDataApi fetchApi = FetchDataApi();
    try {
      if (checkIsLogged() == false)
      await oauth.login();
      String? accessToken = await oauth.getAccessToken();
      showMessage("Logged in successfully, your access token: $accessToken");
      String? idToken = await oauth.getIdToken();
      //showMessage("Logged in successfully, your id token: $idToken");
      print("login was successfully from login");

      user_info = get_login_info(accessToken)!;
      print(user_info.UserName?.split('@')[0]);
      //List<UserProfile> user_file = [];
      // List<ASHAL_ACCESS> ashal_access = [];

      user_profile = await fetchApi.fetchUserProfile(":1:USER_ID='${user_info.UserName!.split('@')[0]}'") as List<UserProfile>;
      ashal_access = await fetchApi.fetchAshalAccess(":1:USER_ID='${user_info.UserName!.split('@')[0]}'") as List<ASHAL_ACCESS>;
      print('User : ${user_profile[0].USER_ID}   Profile : ${user_profile[0].PROFILE}   Area : ${ashal_access[0].ASSET}');
      /*
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          settings: RouteSettings(name: "Home"),
          builder: (context)=>MyHomePage(title: 'Flutter Demo Home Page',
            profile: user_file[0].PROFILE!,
            AshalAccess: ashal_access[0],)));
*/
    } catch (e) {
      showError(e);
    }
  }
  */
  void login() async {
    String? accessToken;
    FetchDataApi fetchApi = FetchDataApi();
 //   try {
      if (IsOn) {
        if (await oauth.tokenIsValid()) {
          accessToken = await oauth.getAccessToken();
          print("login was successfully from checkIsLogged");
        } else {
          await oauth.login();
          accessToken = await oauth.getAccessToken();
          //showMessage("Logged in successfully, your access token: $accessToken");
          String? idToken = await oauth.getIdToken();

          //showMessage("Logged in successfully, your id token: $idToken");
          print("login was successfully from login");
        }

        //user_info = get_login_info(accessToken)!;
        Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
        // Now you can use your decoded token
        print(decodedToken["name"]);
        print(decodedToken["unique_name"]);
        setState(() {
          user_info.GivenName = decodedToken["given_name"].toString();
          user_info.FamilyName = decodedToken["family_name"].toString();
          user_info.FullName = decodedToken["name"].toString();
          user_info.UserName = decodedToken["unique_name"].toString();
        });
        print(user_info.UserName?.split('@')[0]);

        user_profile = await fetchApi.fetchUserProfile(
                ":1:USER_ID='${user_info.UserName!.split('@')[0]}'")
            as List<UserProfile>;
        ashal_access = await fetchApi.fetchAshalAccess(
                ":1:USER_ID='${user_info.UserName!.split('@')[0]}'")
            as List<ASHAL_ACCESS>;
         print(await fetchApi.fetchUserLogin(user_info.UserName!.split('@')[0]));

        print(
            'User : ${user_profile[0].USER_ID}   Profile : ${user_profile[0].PROFILE}   Area : ${ashal_access[0].ASSET}');

        if (user_profile[0].PROFILE == 'wellcompletionlist') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: "Home"),
              builder: (context) => MyHomePageWithPages(
                    title: 'ASHAL',
                    profile: user_profile[0].PROFILE!,
                    AshalAccess: ashal_access[0].ASSET,
                  )));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: "GcLists"),
              builder: (context) => GcListPages(
                    title: 'ASHAL',
                    profile: user_profile[0].PROFILE!,
                    AshalAccess: ashal_access[0].ASSET,
                  )));
        }
      }
      else {
        user_profile = await fetchApi.fetchUserProfile(
            ":1:USER_ID='hmmarri'")
        as List<UserProfile>;
        ashal_access = await fetchApi.fetchAshalAccess(
            ":1:USER_ID='hmmarri'")
        as List<ASHAL_ACCESS>;
        print(await fetchApi.fetchUserLogin('hmmarri'));
        print(
            'User : ${user_profile[0].USER_ID}   Profile : ${user_profile[0].PROFILE}   Area : ${ashal_access[0].ASSET}');
        if (user_profile[0].PROFILE == 'wellcompletionlist') {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: "Home"),
              builder: (context) => MyHomePageWithPages(
                title: 'ASHAL',
                profile: user_profile[0].PROFILE!,
                AshalAccess: ashal_access[0].ASSET,
              )));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              settings: RouteSettings(name: "GcLists"),
              builder: (context) => GcListPages(
                title: 'ASHAL',
                profile: user_profile[0].PROFILE!,
                AshalAccess: ashal_access[0].ASSET,
              )));
        }
      }
    // } catch (e) {
    //   showError(e);
    // }
  }

  void logout() async {
    FetchDataApi fetchApi = FetchDataApi();
    final SharedPreferences prefs = await _prefs;
    await oauth.logout();
    // Remove data for the 'counter' key.
    final success = await prefs.remove('id_token');
    print(await fetchApi.fetchUserLogin('hmmarri'));

    showMessage("Logged out");
  }

  UserInfo? get_login_info(String? id_token) {
    //UserInfo user_info = UserInfo();
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(id_token!);
      // Now you can use your decoded token
      print(decodedToken["name"]);
      print(decodedToken["unique_name"]);
      setState(() {
        user_info.GivenName = decodedToken["given_name"].toString();
        user_info.FamilyName = decodedToken["family_name"].toString();
        user_info.FullName = decodedToken["name"].toString();
        user_info.UserName = decodedToken["unique_name"].toString();
      });
      /* isExpired() - you can use this method to know if your token is already expired or not.
  An useful method when you have to handle sessions and you want the user
  to authenticate if has an expired token */
      bool isTokenExpired = JwtDecoder.isExpired(id_token);

      if (!isTokenExpired) {
        //The user should authenticate
        String? MyName = decodedToken["name"].toString();
        print("Hello $MyName");
      }

      /* getExpirationDate() - this method returns the expiration date of the token */
      DateTime expirationDate = JwtDecoder.getExpirationDate(id_token);

      // 2025-01-13 13:04:18.000
      print(expirationDate);

      /* getTokenTime() - You can use this method to know how old your token is */
      Duration tokenTime = JwtDecoder.getTokenTime(id_token);
      Duration tokenRemainingTime = JwtDecoder.getRemainingTime(id_token);

      // 15
      // print(tokenTime.inDays);
      // print(tokenTime.inHours);

      print('token Remaining Time : ${tokenRemainingTime.inMinutes}');

      return user_info;
    } catch (e) {
      showError(e);
    }
    return null;
  }
}
