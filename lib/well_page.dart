import 'package:ashal_ver_3/services/WellProduction.dart';
import 'package:ashal_ver_3/services/access_info.dart';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellBore.dart';
import 'package:ashal_ver_3/services/wellLatest.dart';
import 'package:ashal_ver_3/services/wellOperationStatus.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/services/wirelineActivity.dart';
import 'package:ashal_ver_3/wellBore_page.dart';
import 'package:ashal_ver_3/wellOperationStatus_page.dart';
import 'package:ashal_ver_3/wellProduction_page.dart';
import 'package:ashal_ver_3/wellTest_page.dart';
import 'package:ashal_ver_3/well_gc_connection_page.dart';
import 'package:ashal_ver_3/wirelineActivity_page.dart';
import 'package:flutter/material.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'NavBar.dart';
import 'constant_values.dart';
import 'main.dart';

class WellPage extends StatefulWidget {
  Well? item;
  List<String>? userPrivilege;
  String? user;

  WellPage({Key? key, required this.item,this.userPrivilege,this.user}) : super(key: key);

  @override
  _WellPageState createState() => _WellPageState();
}

class _WellPageState extends State<WellPage> {
  FetchDataApi fetchApi = FetchDataApi();

  final controller = PageController(
    initialPage: 0,
  );

  //var well_bore;  //late Future<List<WellBore>?>
  late List<WellBore?> well_bore;
  late List<WellLatest?> well_latest; //late Future<List<WellLatest>?>
  late List<WellProduction?> well_production;
  late List<WellTest?> well_test;
  late List<WellOperationStatus?> well_operation_status;
  late List<WirelineActivity?> wireline_activity;
  //late WellBore? wellb;
  var wellb;
  var wellp;
  var wellt;
  var wellopst;
  var wirelineAC;
  var wellLatest;

  bool showLoading = false;

  @override
  initState() {
    showLoading = false;
    if (mounted)  _fetchDara();
    super.initState();

  }

  Future _fetchDara() async {
    /*
    final results = await Future.wait([

      fetchApi.fetchWellBore("::UWI='"+widget.item.UWI.toString()+"'"),
      fetchApi.fetchWellProduction("::UWI='"+widget.item.UWI.toString()+"':production_date desc"),
      fetchApi.fetchWellTest("::UWI='"+widget.item.UWI.toString()+"'"),
      fetchApi.fetchWellOperationStatus("::UWI='"+widget.item.UWI.toString()+"'"),
      fetchApi.fetchWirelineActivity("::UWI='"+widget.item.UWI.toString()+"'"),


      fetchApi.fetchWellLatest("::WELL_COMPLETION_S='"+widget.item!.WELL_COMPLETION_S.toString()+"'")
      //fetchApi.fetchWellLatestByFile()
    ]);
     */
    BodyPost wellPostBody = BodyPost();
    wellPostBody.user =widget.user;
    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item!.WELL_COMPLETION_S}'";
    well_latest = await fetchApi.fetchWellLatestPost(wellPostBody) as List<WellLatest?>;
   //'' well_latest = await fetchApi.fetchWellLatest("::WELL_COMPLETION_S='"+widget.item!.WELL_COMPLETION_S.toString()+"'") as List<WellLatest?>;
    wellLatest =  await well_latest[0];
    print(well_latest);
    setState(() {
     // well_latest = results[0]!.cast<WellLatest?>().toList(); //as  Future<List<WellLatest>?>;
      //wellLatest =  well_latest[0];
      showLoading = true;
    });
  //  setState(() {
  //    _showLoading = false;
  //  });
  }

  @override
  Widget build(BuildContext context) {

    //ScreenUtil.init(context,designSize: Size(360, 690));
    print('WELL_COMPLETION_S '+widget.item!.WELL_COMPLETION_S.toString());
    return 
      SafeArea(
        child: Scaffold(

        appBar: AppBar(
          backgroundColor: ConstantValues.MainColor1,
          iconTheme: IconThemeData(color: Colors.blue),
          title: Center(
              child: Column(
                children: [
                  Text('Main',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                    ),
                  ),
                  Text('${widget.item!.UWI} ${widget.item!.FACILITY_NAME} - ${widget.item!.FACILITY_ID}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
          leadingWidth: 75.w,
          leading: GestureDetector(
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_outlined,color: Colors.blue,),
                Text("Wells",style: TextStyle(fontSize: 15.sp,color: Colors.blue),),
              ],
            ),
            onTap: () {
              Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyHomePageWithPages(title: 'Flutter Demo Home Page')));
            },
          ),
        ),
        endDrawer: NavBar(uwi: widget.item!.UWI,well_completion: widget.item!.WELL_COMPLETION_S,my_well: widget.item,userPrivilege: widget.userPrivilege,user:widget.user),
        body: Center(
          child: Container(
            //color: Colors.red,
            child: Column(
              children: [
                Container(
                  height: 250.h,
                  width: double.infinity,
                  child: AboveContentWell(),
                ),
                Container(
                  height: 300.h,
                  width: double.infinity,
                  child: BelowContentWell(),
                ),
                Container(
                  height: 20.h,
                  width: double.infinity,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 6,
                      effect: SwapEffect(
                        activeDotColor: Colors.deepPurple,
                        dotColor: Colors.deepPurple.shade100,
                        //dotHeight: 15,
                        //dotWidth: 15,
                        //spacing: 8
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    ),
      );
      /*ScreenUtilInit(
      designSize: Size(360,640),
      builder: (child) => Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.item!.UWI.toString())),
          leadingWidth: 75,
          leading: GestureDetector(
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_outlined),
                Text("Wells",style: TextStyle(fontSize: 20),),
              ],
            ),
            onTap: () {
                  Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Flutter Demo Home Page')));
        },
          ),
        ),
        endDrawer: NavBar(uwi: widget.item!.UWI,well_completion: widget.item!.WELL_COMPLETION_S,my_well: widget.item,),
        body: Center(
          child: Container(
            //color: Colors.red,
            child: Column(
              children: [
                Expanded(

                  flex: 45,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                      child: AboveContentWell()
                  ),
                ),
                Expanded(
                  flex: 50,
                    child: (wellLatest == null )
                        ?  SpinKitCircle(size: 140,color: Colors.deepPurple,)// CircularProgressIndicator()
                        : BelowContentWell(),
                  ),
                Expanded(
                    flex: 5,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 5,
                      effect: SwapEffect(
                        activeDotColor: Colors.deepPurple,
                        dotColor: Colors.deepPurple.shade100,
                        //dotHeight: 15,
                        //dotWidth: 15,
                        //spacing: 8
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );*/

  }

  PageView BelowContentWell() {


        if(!showLoading) {
          return PageView(
            controller: controller,
            onPageChanged: (page) => {print(page.toString())},
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            children: [
             //Center(child: Text("No Data",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
              Center(child: SpinKitCircle(size: 140,color: Colors.deepPurple,))
            ],
          );
        }
        else
        {
          return PageView(
            controller: controller,
            onPageChanged: (page) => {print(page.toString())},
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            children: [
              WellBorePage(item: wellLatest),
              WellProductionPage(item: wellLatest ),
              WellTestPage(item: wellLatest),
              WellOperationStatusPage(item: wellLatest ),
              WirelineActivityPage(item: wellLatest ),
              WellGcConnectionPage(item: wellLatest),
            ],
          );
        }
        

  }

  Column AboveContentWell() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Area',
                      style:
                          TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0.02.sh),
                  Text(widget.item!.AREA.toString(),
                      style: TextStyle(fontSize: 20.sp)),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.r),
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundColor: widget.item!.OPERATION_STATUS == 'OPEN'
                          ? Colors.lightGreen
                          : Colors.redAccent,
                      child: CircleAvatar(
                          radius: 55.r,
                          backgroundColor: widget.item!.OPERATION_STATUS == 'OPEN'
                              ? Colors.greenAccent
                              : Colors.red,
                          child:
                              //Text('uwi',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.item!.UWI.toString(),
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),textAlign: TextAlign.center,),
                                  Text(widget.item!.FACILITY_NAME.toString()+" - "+widget.item!.FACILITY_ID.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),textAlign: TextAlign.center,),
                                ],
                              ))
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('Field',
                      style:
                          TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 0.02.sh),
                  Text(widget.item!.FIELD.toString(),
                      style: TextStyle(fontSize: 20.sp))
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.r),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 0.27.sw,
                //color: Colors.redAccent,
                child: Column(
                  children: [
                    Text('Reservoir',
                        style:
                            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 0.02.sh),
                    Text(widget.item!.RESERVOIR_ID.toString(),
                        style: TextStyle(fontSize: 15.sp))
                  ],
                ),
              ),
              Container(
                //color: Colors.blueGrey,
                width: 0.4.sw,
                child: Column(
                  children: [
                    Text('Status',
                        style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 0.02.sh),
                    Text(widget.item!.CURRENT_STATUS.toString(),textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp))
                  ],
                ),
              ),
              Container(
                width: 0.27.sw,
                //color: Colors.cyanAccent,
                child: Column(
                  children: [
                    Text('Lift Method',
                        style:
                            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 0.02.sh),
                    Text(widget.item!.LIFT_METHOD.toString(),
                        style: TextStyle(fontSize: 15.sp))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
