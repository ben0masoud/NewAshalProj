


import 'dart:io';

import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/user_info.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/welcome_page.dart';
import 'package:ashal_ver_3/well_page.dart';
import 'package:ashal_ver_3/widgets/custom_container.dart';
import 'package:ashal_ver_3/widgets/custom_text.dart';
import 'package:ashal_ver_3/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (ctx, child) => MaterialApp(
        title: 'ASHAL',
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xFFBDEDB3),
          ),
          //canvasColor: Color(0xFFBDEDB3),
          //primaryColor: Color(0xFFBDEDB3),
         // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

        ),
        home: child, //new MyHomePage(title: 'Ashal Project'),
        //home: new MyHomePage(title: 'Ashal Project'),
        debugShowCheckedModeBanner: false,
      ),
      child: const WelcomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title, this.profile, this.AshalAccess}) : super(key: key);
  final String title;
  final String? profile;
  final String? AshalAccess;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Well?> wells=[];
 late List<Well?> wellsSearch = [];
  String query='';

  @override
  void initState(){
    super.initState();
    wellsSearch = wells;
  }


  @override
  Widget build(BuildContext context) {

    FetchDataApi fetchApi = FetchDataApi();


    Future<List<Well>?> GetData(String prof,String access)
    {
      if(prof == 'wellcompletionlist')
        {
          if(access == 'ALL AREA')
            {
              return fetchApi.fetchWell('');
            }
          else
            {
              return fetchApi.fetchWell("::AREA='${access}'");
            }
        }
      else
        return fetchApi.fetchWell('');

    }

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
  }
  ListView WellResult(List<Well?> SearchedWell) {
    return ListView.builder(
      itemCount: (SearchedWell == null) ? 0 : SearchedWell.length,
      itemBuilder: (context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: GestureDetector(
            child: _CompletionCard1(SearchedWell[index]),
            onTap: () {
              print(SearchedWell[index]!.UWI.toString());
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => WellPage(item: SearchedWell[index]),
                  settings: RouteSettings(name: "Well_Page"),

                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildSearch() => SearchWidget(
      text: query,
      onChanged: searchWell,
      hintText: 'Type Well'
  );

  void searchWell(String query) {
    final wellsSearch =wells.where((w)  {
      final wellLower = w!.UWI!.toLowerCase();
      final searchLower = query.toLowerCase();
      return wellLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.wellsSearch = wellsSearch;
    });
  }

}
Widget _CompletionCard(Well? well) {
  Color colorStatus = Colors.red;
  if (well!.OPERATION_STATUS == "OPEN")
    colorStatus = Colors.green;
  else
    colorStatus = Colors.red;
  return CustomContainer(
    width: 340.w,
    height: 102.h,
    color: Color(0xFFF4FBFF),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
      child: Row(
        children: [
          // SizedBox(width: 5.w,),
          CustomContainer(
            width: 28.w,
            height: 84.h,
            color: colorStatus,
            child: SizedBox(),
          ),
          CustomContainer(
            width: 110.w,
            height: 84.h,
            color: Color(0xFFFFF9F9),
            child: Center(
              child: CustomText(
                text: "${well.UWI ?? ''}  - ${well.FACILITY_NAME ?? ''}",
                   // : well.FACILITY_NAME.toString(),
                textAlign: TextAlign.center,
               // size: 16.sp,
                fontwdth: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(width: 5.w,),
          Column(
            children: [
              CustomContainer(
                width: 190.w,
                height: 46.h,
                color: Color(0xFF5C799B),
                child: Center(
                    child: CustomText(
                      text: well.CURRENT_STATUS.toString(),
                      textAlign: TextAlign.center,
                   //   size: 16.sp,
                      fontwdth: FontWeight.bold,
                    )),
              ),
              // SizedBox(height: 5.h,),
              Row(
                children: [
                  CustomContainer(
                    width: 95.w,
                    height: 38.h,
                    color: Color(0xFFFFF9F9),
                    child: Center(
                        child: CustomText(
                          text: well.FACILITY_NAME.toString() +
                              " - " +
                              well.FACILITY_ID.toString(),
                          textAlign: TextAlign.center,
                          size: 14.sp,
                          fontwdth: FontWeight.bold,
                        )),
                  ),
                  //SizedBox(width: 5.w,),
                  CustomContainer(
                    width: 95.w,
                    height: 38.h,
                    color: Color(0xFFFBFE69),
                    child: Center(
                      child: CustomText(
                        text: well.LIFT_METHOD.toString(),
                        textAlign: TextAlign.center,
                      //  size: 14.sp,
                        fontwdth: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _CompletionCard1(Well? well) {
  Color colorStatus = Colors.red;
  if (well!.OPERATION_STATUS == "OPEN")
    colorStatus = Colors.green;
  else
    colorStatus = Colors.red;
  return Container(
    width: 340.w,
    height: 102.h,
    color: Color(0xFFF4FBFF),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
      child: Row(
        children: [
          Container(
            width: 28.w,
            height: 84.h,
            decoration: BoxDecoration(
              color: colorStatus,
              border: Border.all(color: Colors.black),
              // borderRadius: BorderRadius.circular(5.r)
            ),
          ),
          // SizedBox(width: 5.w,),
          Container(
            width: 110.w,
            height: 84.h,
            decoration: BoxDecoration(
              color: Color(0xFFFFF9F9),
              border: Border.all(color: Colors.black),
              // borderRadius: BorderRadius.circular(5.r)
            ),
            child: Center(
                child: Text(
                  "${well.UWI ?? ''}  - ${well.FACILITY_NAME ?? ''}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      //fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                )),
          ),
          // SizedBox(width: 5.w,),
          Column(
            children: [
              Container(
                width: 190.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: Color(0xFF345A7F),
                  border: Border.all(color: Colors.black),
                  //  borderRadius: BorderRadius.circular(5.r)
                ),
                child: Center(
                    child: Text(
                      well.CURRENT_STATUS.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                        //  fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              // SizedBox(height: 5.h,),
              Row(
                children: [
                  Container(
                    width: 95.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF9F9),
                      border: Border.all(color: Colors.black),
                      // borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Center(
                        child: Text(
                          well.FACILITY_NAME.toString() +
                              " - " +
                              well.FACILITY_ID.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                             // fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  //SizedBox(width: 5.w,),
                  Container(
                    width: 95.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFD98654),
                      border: Border.all(color: Colors.black),
                      // borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Center(
                        child: Text(
                          well.LIFT_METHOD.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              //fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),

                        ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

