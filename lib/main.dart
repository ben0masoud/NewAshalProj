import 'dart:io';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/navigation_service.dart';
import 'package:ashal_ver_3/wellcome_page1.dart';
import 'package:get/get.dart';
import 'package:ashal_ver_3/pages/wellCompletion/all_area.dart';
import 'package:ashal_ver_3/pages/wellCompletion/n_area.dart';
import 'package:ashal_ver_3/pages/wellCompletion/o_area.dart';
import 'package:ashal_ver_3/pages/wellCompletion/s_area.dart';
import 'package:ashal_ver_3/pages/wellCompletion/w_area.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
//import 'package:ashal_ver_3/services/user_info.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/welcome_page.dart';
//import 'package:ashal_ver_3/well_page.dart';
//import 'package:ashal_ver_3/widgets/custom_container.dart';
//import 'package:ashal_ver_3/widgets/custom_text.dart';
//import 'package:ashal_ver_3/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constant_values.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (ctx, child) => MaterialApp(
       // navigatorKey:  NavigationService.navigatorKey,
        title: 'ASHAL',
        home: WelcomePage1(), //new MyHomePage(title: 'Ashal Project'),
        //home: new MyHomePage(title: 'Ashal Project'),
        debugShowCheckedModeBanner: false,
      ),
      child: const WelcomePage1(),
    );
  }
}

class MyHomePageWithPages extends StatefulWidget {
  const MyHomePageWithPages(
      {Key? key, required this.title,this.user, this.profile,this.AshalAccess,this.Gc,this.Area})
      : super(key: key);
  final String title;
  final String? user;
  final String? profile;
  final List<String>? AshalAccess;
  final String? Gc;
  final String? Area;

 // final UserProfile? profile;
 // final ASHAL_ACCESS? AshalAccess;

  @override
  State<MyHomePageWithPages> createState() => _MyHomePageWithPagesState();
}

class _MyHomePageWithPagesState extends State<MyHomePageWithPages> {
  late List<Well?> wells = [];
  late List<Well?> wellsSearch = [];
  String query = '';
  late List<Well>? AllWells = [];
  late List<Well>? nkData = [];
  late List<Well>? wkData = [];
  late List<Well>? skData = [];
  late List<Well>? otherData = [];
  int index = 0;
  late List screens;
  late int selectedPage = 0;

  @override
  void initState() {
    AllWells = [];
    nkData = [];
    wkData = [];
    screens = [];
    selectedPage = 0;
    super.initState();
    wellsSearch = wells;
    fetchWellCompletion(widget.profile!, widget.Area!,widget.user!);
  }

  //AllWells = GetData(widget.profile!,widget.AshalAccess!);
  //FetchDataApi fetchApi = FetchDataApi();

  Future fetchWellCompletion(String prof, String access,String user) async {
    FetchDataApi fetchApi = FetchDataApi();

    BodyPost wellPostBody = BodyPost();
    wellPostBody.user =user;

  // AllWells = await fetchApi.fetchWellPost(wellPostBody);

    //final String response = await rootBundle.loadString('assets/well_completion.json');
    try {
      // print('the response is '+response.statusCode.toString());
      AllWells!.clear();
      if (prof == 'wellcompletionlist') {
        if (access == 'ALL AREA') {
          //AllWells = await fetchApi.fetchWell('') as List<Well>?;
          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
        } else {
          wellPostBody.whereCondition = "AREA='${access}'";
          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
          //AllWells = await fetchApi.fetchWell("::AREA='${access}'") as List<Well>?;
        }
      } else if(prof =='GcLists')
        {
          if (access == 'ALL AREA') {
            wellPostBody.whereCondition = "GC='${widget.Gc}'";
            AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
            //AllWells = await fetchApi.fetchWell("::GC='${widget.Gc}'") as List<Well>?;
          } else {
            wellPostBody.whereCondition = "AREA='${access}' AND GC='${widget.Gc}'";
            AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
         //   AllWells = await fetchApi.fetchWell("::AREA='${access}' AND GC='${widget.Gc}'") as List<Well>?;
          }
        }
      else
        AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
       // AllWells = await fetchApi.fetchWell('') as List<Well>?;

      if (AllWells!.isNotEmpty) {
        setState(() {
          selectedPage = 0;
          //  print('AllWells = ${AllWells!.length}');
          nkData = AllWells!.where((e) => e.AREA == "NK").toList();
          //  print('nkData = ${nkData!.length}');
          wkData = AllWells!.where((e) => e.AREA == "WK").toList();
          //  print('wkData = ${wkData!.length}');
          skData = AllWells!.where((e) => e.AREA == "SK").toList();
          //  print('skData = ${skData!.length}');
          otherData = AllWells!
              .where((e) => e.AREA != "SK" && e.AREA != "WK" && e.AREA != "NK")
              .toList();
          // print('otherData = ${otherData!.length}');
          screens = [
            AllArea(
              wellList: AllWells,
              userPrivilege: widget.AshalAccess,
            ),
            NArea(
              wellList: nkData,
              userPrivilege: widget.AshalAccess,
            ),
            SArea(
              wellList: skData,
              userPrivilege: widget.AshalAccess,
            ),
            WArea(
              wellList: wkData,
              userPrivilege: widget.AshalAccess,
            ),
            OArea(
                wellList: otherData,
               userPrivilege: widget.AshalAccess,
            )
          ];
        });
      }

    } on SocketException catch (e) {
      print('e is ${e.osError}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
/*
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              buildSearch(),
              Expanded(
                       child: FutureBuilder(
                         future: GetData(widget.profile!,widget.AshalAccess!),//fetchApi.fetchWell(''),
                         builder: (BuildContext context, AsyncSnapshot snapshot) {
                           if(snapshot.hasData){

                             wells = snapshot.data;
                             return wellsSearch.length != 0 ||
                                 query.isNotEmpty
                                 ? WellResult(wellsSearch)
                                 : WellResult(wells);

                             /*
                             return ListView.builder(
                               itemCount: (wellsSearch == null) ? 0 : wellsSearch.length,
                               itemBuilder: (context, int index) {
                                 return Padding(
                                   padding: EdgeInsets.symmetric(horizontal: 8.w),
                                   child: GestureDetector(
                                     child: _CompletionCard1(wellsSearch[index]),
                                     onTap: () {
                                       print(wellsSearch[index]!.UWI.toString());
                                       Navigator.push(context,
                                         MaterialPageRoute(
                                           builder: (context) => WellPage(item: wellsSearch[index]),
                                           settings: RouteSettings(name: "Well_Page"),

                                         ),
                                       );
                                     },
                                   ),
                                 );
                               },
                             );
                            */
                           }
                           else {
                             return Center(
                               child: SpinKitCircle(size: 50, color: Colors.deepPurple,),
                             );
                           }
                         },
                       ),
              ),
            ],
          ),
        ),
      ),

    );
    */
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ConstantValues.MainColor1,

          title: Text('Well Completion List',style: TextStyle(color: Colors.black),),
        ),
        body: AllWells!.isNotEmpty
            ? screens[selectedPage]
            : Center(child: CircularProgressIndicator()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ConstantValues.MainColor1,//ThemeData().primaryColor,//Color(0xFF6200EE),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 16,
          unselectedFontSize: 16,
          onTap: (value) {
            // Respond to item press.
            setState(() => selectedPage = value);
          },
          items: [
            BottomNavigationBarItem(
                label: 'All', //AllWells!.length.toString(),
                icon: buildCustomBadget(
                  counter: AllWells!.length,
                  child:  ImageIcon(
                    AssetImage('assets/icons/Center-Direction-icon.png'),
                    size: 32,
                  )
                )
               //Icon(Icons.favorite),
                ),
            BottomNavigationBarItem(
                label: nkData!.length.toString(),
                icon: ImageIcon(
                  AssetImage('assets/icons/North-Direction-icon.png'),
                  size: 32,
                ) //Icon(Icons.music_note),
                ),
            BottomNavigationBarItem(
                label: skData!.length.toString(),
                icon: ImageIcon(
                  AssetImage('assets/icons/South-Direction-icon.png'),
                  size: 32,
                ) //Icon(Icons.location_on),
                ),
            BottomNavigationBarItem(
                label: wkData!.length.toString(),
                icon: ImageIcon(
                  AssetImage('assets/icons/West-Direction-icon.png'),
                  size: 32,
                ) //Icon(Icons.library_books),
                ),
            BottomNavigationBarItem(
                label: otherData!.length.toString(),
                icon: ImageIcon(
                  AssetImage('assets/icons/Center-Direction-icon.png'),
                  size: 32,
                ) //Icon(Icons.ac_unit_sharp),
                ),
          ],
        ));
  }
  Widget buildCustomBadget({required int counter,required Widget child}) {
    final text = counter.toString();
    final deltaFontSize = (text.length -1) * 3.0;
    return Stack(
      clipBehavior:Clip.none,
      children: [
        child,
        Positioned(
            top: -6,
            right: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 10,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16 - deltaFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            )
        )
      ],
    );
  }
}
