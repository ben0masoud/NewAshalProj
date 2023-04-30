import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:ashal_ver_3/services/access_info.dart';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/custom_feedback.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/widgets/user_container.dart';
import 'package:ashal_ver_3/pages/wellCompletion/well_complition_list_page.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'pages/gc_list/gc_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
bool _useCustomFeedback = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (ctx, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  MyHomePage(_toggleCustomizedFeedback),
          navigatorKey: navigatorKey,
        ),
        child: MyHomePage(_toggleCustomizedFeedback),
      ),
      feedbackBuilder: _useCustomFeedback
          ? (context, onSubmit, scrollController) => CustomFeedbackForm(
        onSubmit: onSubmit,
        scrollController: scrollController,
      )
          : null,
      theme: FeedbackThemeData(
        background: Colors.grey,
        feedbackSheetColor: Colors.grey[50]!,
        drawColors: [
          Colors.red,
          Colors.green,
          Colors.blue,
          Colors.yellow,
        ],
      ),
      localizationsDelegates: [
        GlobalFeedbackLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeOverride: const Locale('en'),
      mode: FeedbackMode.draw,
      pixelRatio: 1,
    );
  }

  void _toggleCustomizedFeedback() =>
      setState(() => _useCustomFeedback = !_useCustomFeedback);
}

class MyHomePage extends StatefulWidget {
  MyHomePage(this.toggleCustomizedFeedback,{super.key});
  final VoidCallback toggleCustomizedFeedback;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {


  static final Config config = Config(
      tenant: 'e7c58320-6dbf-4137-b708-5142fc7b1e52',
      clientId: '20a2b586-3f48-4555-882f-4b5fa090a116',
      redirectUri : "msauth://com.kockw.ashalim/qYu8bFUMsSRFu7NTRebnOIqHprE%3D",
      scope: '20a2b586-3f48-4555-882f-4b5fa090a116/.default',//'openid profile offline_access',
      navigatorKey: navigatorKey,
      loader:  const Center(child: CircularProgressIndicator()));

  final AadOAuth oauth = AadOAuth(config);


  late AnimationController _controller;
  UserPrivilege? user_priv;
  //late bool doAction;

  String UserName='';//="Sign in";
  bool doAction = false ;//=> UserName.isEmpty;
  FetchDataApi fetchApi = FetchDataApi();
  @override

  Future<void> getUserName() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String getUser = (prefs.getString("user_name") ?? "Sign in");
    final bool finish = getUser.isEmpty;
    setState(() {
      UserName =   getUser;
      doAction = finish;
    });


  }
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(duration:Duration(milliseconds: 5000),
        vsync: this
    );

    getUserName();
    setState(() {

      //this.doAction=false;
    });
    super.initState();


  }
  ParticleOptions particles = const ParticleOptions(
    image: Image(
        image: AssetImage("assets/MainScreen_Stars.jpg"),
        fit: BoxFit.cover),
    baseColor: Colors.white,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/MainScreen_Stars.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body: AnimatedBackground(
          // vsync uses singleTicketProvider state mixin.
          vsync: this,
          behaviour: RandomParticleBehaviour(options: particles),
          child: Stack(
            children: [
              Positioned(
                top: 30,
                child: Container(
                    height: 250,
                    width: 150,
                    child: Image(
                        image: AssetImage("assets/AshalAppLogo.png"),
                        fit: BoxFit.cover)
                ),
              ),
              Positioned(
                top: 143,
                left: 140,
                child: Container(
                    height: 250,
                    width: 300,
                    child: Text('SHAL',style: TextStyle(fontSize: 80,color: Colors.white),)
                ),
              ),
              Positioned(
                left: 10,//MediaQuery.of(context).size.width * 0.2,
                right: 10,//MediaQuery.of(context).size.width * 0.2,
                top: MediaQuery.of(context).size.height * 0.2,
                bottom: MediaQuery.of(context).size.height * 0.3,
                child: Container(
                    height: 200,
                    width: 200,
                    child: Image(image: AssetImage("assets/light_drop.png"), fit: BoxFit.cover)
                ),
              ),
              Positioned(
                left: (UserName !="Sign in") ? MediaQuery.of(context).size.width * 0.15 : MediaQuery.of(context).size.width * 0.3,
                top: MediaQuery.of(context).size.height * 0.35,
                child: (UserName !="Sign in")
                    ? UserContainer(
                  child: (doAction) ? CupertinoActivityIndicator(radius: 40,) : Text(UserName.split('@')[0],style: TextStyle(fontSize: 40,color: Colors.white),),
                  width: 300,
                  borderColor: Colors.white,
                  backgroudColor:Color(0xFFC9E5AE) ,
                  onTap: (){
                    setState(() {
                      doAction=true;
                    });

                    login(true);
                   // this.doAction=false;
                  },
                )
                    : CircleAvatar(
                  radius: 90,
                  backgroundColor:Colors.white,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor:Color(0xFFC9E5AE),
                    child:  loginButton(doAction),
                  ),
                ),
              ),

              if(this.UserName !="Sign in")
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.45,
                  top: MediaQuery.of(context).size.height * 0.58,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 20,
                          ),
                        ),
                      ),
                      Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.person_remove),
                          color: Color(0xFFC9E5AE),
                          onPressed: () {
                            logout();
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              Positioned(
                bottom: -10,
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image(image: AssetImage("assets/MainScreen_Land.png"), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 200,
                right: 30,
                child: Container(
                  height: 120,
                  width: 120,
                  child: Image(image: AssetImage("assets/rig2.png"), fit: BoxFit.fill),
                ),
              ),
              Positioned(
                bottom: 230,
                left: 20,
                child: Container(
                  height: 120,
                  width: 120,
                  child: Image(image: AssetImage("assets/rig1.png"), fit: BoxFit.fill),
                ),
              ),
              Positioned(
                bottom: 160,
                left: 150,
                child: Container(
                  height: 50,
                  width: 30,
                  child: Image(image: AssetImage("assets/Wellhead.png"), fit: BoxFit.fill),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 50,
                child: Container(
                  height: 70,
                  width: 50,
                  child: Image(image: AssetImage("assets/Wellhead.png"), fit: BoxFit.fill),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                child: Container(

                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Text('Powered by Kuwait Oil Company\nExploration and Production Information Management Team.',
                               style: TextStyle(fontSize: 12,color: Colors.white,),
                                textAlign: TextAlign.center,),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
  void login(bool redirect) async {
    config.webUseRedirect = redirect;
    final result = await oauth.login();
    result.fold(
          (l) => print(l.toString()),
          (r) => print('Logged in successfully, your access token: $r'),
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged in successfully'))),
    );
    var accessToken = await oauth.getAccessToken();
    if (accessToken != null) {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged in successfully')));
      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken!);
      this.UserName = decodedToken["unique_name"].toString();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("user_name", this.UserName);

      AccessInfo access_info = await AccessInfo(accessToken, this.UserName);
      user_priv = await access_info.get_info();

      if(AccessPage(user_priv!) == false) {
        print("user have no profile");
        //this.doAction = false;
      }
      else {
      //  this.doAction = true;
      }
      User user = User();
      user.user = this.UserName.split('@')[0];

      fetchApi.fetchUserLoginPost(user);


      //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  WellCompletionListPage(title: "")));
    }
  }

  void logout() async {
    await oauth.logout();
    //showMessage('Logged out');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('user_name');
    User user = User();
    user.user = this.UserName.split('@')[0];
    fetchApi.fetchUserLogoutPost(user);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Logged out')));
    setState(() {
      this.UserName = "Sign in";
    });
  }

  Widget loginButton(bool doAction){
    return GestureDetector(
      onTap: (){
        setState(() {
          this.doAction=true;
          login(true);
        });

      },
      child: (this.doAction) ? CupertinoActivityIndicator(radius: 60,) : Text(this.UserName.split('@')[0],style: TextStyle(fontSize: 40,color: Colors.white),),
    );
  }


  Future<bool> AccessPage(UserPrivilege usr_priv) async {

   // usr_priv = (await appSecurity.loginWithAD())!;
    if (usr_priv.PROFILE!.toUpperCase() == 'wellcompletionlist'.toUpperCase()) {
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          settings: RouteSettings(name: "wellcompletionlist"),
          builder: (context) => WellCompletionListPage(
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

Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
  final Directory output = await getTemporaryDirectory();
  final String screenshotFilePath = '${output.path}/feedback.png';
  final File screenshotFile = File(screenshotFilePath);
  await screenshotFile.writeAsBytes(feedbackScreenshot);
  return screenshotFilePath;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
