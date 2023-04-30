/*
import 'dart:ui';

import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/welcome_page.dart';
import 'package:ashal_ver_3/well_page.dart';
import 'package:ashal_ver_3/widgets/custom_container.dart';
import 'package:ashal_ver_3/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:group_list_view/group_list_view.dart';
//import 'package:grouped_list/grouped_list.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ashal_ver_3/NavBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),

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
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController? _textEditingController = TextEditingController();
  late List<Well?> wells;
  late List<Well?> wellsSearch = [];
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text('Ashal Project');
  Widget build(BuildContext context) {
    FetchDataApi fetchApi = FetchDataApi();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search value",
                        hintStyle: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.bold)),
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    controller: _textEditingController,
                    onChanged: (value) {
                      setState(() {
                        wellsSearch = wells
                            .where((e) => e!.UWI!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                            .toList();
                        print(wellsSearch.length);
                      });
                    },
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text('Ashal Project');
                  _textEditingController!.clear();
                  wellsSearch = [];
                }
              });
            },
            icon: cusIcon,
          ),
        ],
        title: cusSearchBar,
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchApi
              .fetchWell(''), //fetchWellByFile(),  //fetchApi.fetchWell(),

          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //print(_dataDummy);

            if (snapshot.hasData) {
              wells = snapshot.data;

              return wellsSearch.length != 0 ||
                  _textEditingController!.text.isNotEmpty
                  ? WellSearch(wellsSearch)
                  : WellSearch(wells);
            }
            return Center(
                child: SpinKitCircle(
                  size: 140,
                  color: Colors.deepPurple,
                ));
          },
        ),
      ),
    );
  }

  ListView WellSearch(List<Well?> SearchedWell) {
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

  Color _getAvatarColor(String user) {
    return AppColors
        .avatarColors[user.hashCode % AppColors.avatarColors.length];
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
                text: (well.UWI.toString().isNotEmpty)
                    ? well!.UWI.toString() +
                    " - " +
                    well.FACILITY_NAME.toString()
                    : well.FACILITY_NAME.toString(),
                textAlign: TextAlign.center,
                size: 16.sp,
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
                      size: 16.sp,
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
                        size: 14.sp,
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
                  well!.UWI.toString() + " - " + well.FACILITY_NAME.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                )),
          ),
          // SizedBox(width: 5.w,),
          Column(
            children: [
              Container(
                width: 190.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: Color(0xFF5C799B),
                  border: Border.all(color: Colors.black),
                  //  borderRadius: BorderRadius.circular(5.r)
                ),
                child: Center(
                    child: Text(
                      well.CURRENT_STATUS.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
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
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        )),
                  ),
                  //SizedBox(width: 5.w,),
                  Container(
                    width: 95.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFFBFE69),
                      border: Border.all(color: Colors.black),
                      // borderRadius: BorderRadius.circular(5.r)
                    ),
                    child: Center(
                        child: Text(
                          well.LIFT_METHOD.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        )),
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

class AppColors {
  static const List<Color> avatarColors = [
    Color(0xffe57373),
    Color(0xfff06292),
    Color(0xffba68c8),
    Color(0xff9575cd),
    Color(0xff7986cb),
    Color(0xff64b5f6),
    Color(0xff4fc3f7),
    Color(0xff4dd0e1),
    Color(0xff4db6ac),
    Color(0xff81c784),
    Color(0xffaed581),
    Color(0xffff8a65),
    Color(0xffd4e157),
    Color(0xffffd54f),
    Color(0xffffb74d),
    Color(0xffa1887f),
    Color(0xff90a4ae)
  ];
}

 */
