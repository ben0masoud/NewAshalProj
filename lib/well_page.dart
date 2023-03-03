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
import 'package:ashal_ver_3/well_completion_detial_page.dart';
import 'package:ashal_ver_3/well_gc_connection_page.dart';
import 'package:ashal_ver_3/well_location.dart';
import 'package:ashal_ver_3/well_complition_list_page.dart';
import 'package:ashal_ver_3/wirelineActivity_page.dart';
import 'package:flutter/cupertino.dart';
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
  List<Well>? wells;

  WellPage({Key? key, required this.item,this.userPrivilege,this.user,this.wells}) : super(key: key);

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
  late List<Well>? AllWellsInReservoir;
  late List<Well>? AllWellsInField;
  late List<Well>? AllWellsInArea;

  //late WellBore? wellb;
  var wellb;
  var wellp;
  var wellt;
  var wellopst;
  var wirelineAC;
  var wellLatest;

  List<String> _all_well = <String>[];


  bool showLoading = false;
  static const double _kItemExtent = 32.0;
  int _selectedWellCompletion = 0;

  @override
  initState() {
    showLoading = false;
    if (mounted) _fetchDara();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future _fetchDara() async {
    BodyPost wellPostBody = BodyPost();
    wellPostBody.user = widget.user;
    wellPostBody.whereCondition =
    "WELL_COMPLETION_S='${widget.item!.WELL_COMPLETION_S}'";
    well_latest =
    await fetchApi.fetchWellLatestPost(wellPostBody) as List<WellLatest?>;
    //'' well_latest = await fetchApi.fetchWellLatest("::WELL_COMPLETION_S='"+widget.item!.WELL_COMPLETION_S.toString()+"'") as List<WellLatest?>;
    wellLatest = await well_latest[0];
    //BodyPost wellPostBody = BodyPost();
    // wellPostBody.user = widget.user;
    /*
    wellPostBody.whereCondition = "RESERVOIR_ID='${widget.item!.RESERVOIR_ID}'";
    AllWellsInReservoir =
    await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
    wellPostBody.whereCondition = "FIELD='${widget.item!.FIELD}'";
    AllWellsInField = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
    wellPostBody.whereCondition = "AREA='${widget.item!.AREA}'";
    AllWellsInArea = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;*/
    //print(well_latest);
    setState(() {
      // well_latest = results[0]!.cast<WellLatest?>().toList(); //as  Future<List<WellLatest>?>;
      //wellLatest =  well_latest[0];
      showLoading = true;
    });
    //  setState(() {
    //    _showLoading = false;
    //  });
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) =>
            Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context,designSize: Size(360, 690));
    print('WELL_COMPLETION_S ' + widget.item!.WELL_COMPLETION_S.toString());
    return
      SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                    Text('${widget.item!.UWI} ${widget.item!
                        .FACILITY_NAME} - ${widget.item!.FACILITY_ID}',
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
                  Icon(Icons.arrow_back_ios_outlined, color: Colors.blue,),
                  Text("Wells",
                    style: TextStyle(fontSize: 15.sp, color: Colors.blue),),
                ],
              ),
              onTap: () {
               // Navigator.of(context).pushAndRemoveUntil(
               //     MaterialPageRoute(
              //        builder: (context) => WellCompletionListPage(title: 'Flutter Demo Home Page'),),
               //       ModalRoute.withName('wellcompletionlist')
               // );
                Navigator.of(context).pop(ModalRoute.withName('wellcompletionlist'));
              },
            ),
          ),
          endDrawer: NavBar(uwi: widget.item!.UWI,
              well_completion: widget.item!.WELL_COMPLETION_S,
              my_well: widget.item,
              userPrivilege: widget.userPrivilege,
              user: widget.user,
              wells: widget.wells,
          ),
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
                        count: 7,
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
    if (!showLoading) {
      return PageView(
        controller: controller,
        onPageChanged: (page) => {print(page.toString())},
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        children: [
          //Center(child: Text("No Data",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
          Center(
            child: CupertinoActivityIndicator(radius: 60,
              color: Colors
                  .deepPurple,), //SpinKitCircle(size: 140,color: Colors.deepPurple,),

          )
        ],
      );
    }
    else {
      return PageView(
        controller: controller,
        onPageChanged: (page) => {print(page.toString())},
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        children: [
          WellBorePage(item: wellLatest),
          WellLocation(item: wellLatest),
          WellProductionPage(item: wellLatest),
          WellTestPage(item: wellLatest),
          WellOperationStatusPage(item: wellLatest),
          WirelineActivityPage(item: wellLatest),
          WellGcConnectionPage(item: wellLatest),
        ],
      );
    }
  }


  List<Color> BackgroundStatus(String? wellStatus) {
    List<Color> statusColor = [];


    // widget.item!.OPERATION_STATUS

    if (wellStatus == "OPEN") {
      statusColor.add(Colors.green);
      statusColor.add(Colors.greenAccent);
    }
    else if (wellStatus == "CLOSE") {
      statusColor.add(Colors.red);
      statusColor.add(Colors.redAccent);
    } else {
      statusColor.add(Colors.grey);
      statusColor.add(Colors.blueGrey);
    }

    return statusColor;
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
                  GestureDetector(
                    child: Text(widget.item!.AREA.toString(),
                      style: TextStyle(fontSize: 20.sp, color: Colors.blue),
                    ),
                    onTap: () async {
                      final String? uwi = await showCupertinoModalPopup(
                          context: context,
                          builder: (context) =>
                              Container(
                                height: 400,
                                padding: const EdgeInsets.only(top: 6.0),
                                margin: EdgeInsets.only(
                                  bottom: MediaQuery
                                      .of(context)
                                      .viewInsets
                                      .bottom,
                                ),
                                color: CupertinoColors.systemBackground
                                    .resolveFrom(context),
                                child: SafeArea(
                                  top: false,
                                  child: buildActionSheet(
                                      context, widget.wells,
                                      'AREA',
                                      widget.item!.AREA.toString()),
                                  //buildActionSheet(BuildContext context, List<WellLatest>? list,List<Well>? lst,String? field, String item)
                                ),
                              )
                      );
                      //print(uwi!);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: GestureDetector(
                      child: CircleAvatar(
                          radius: 60.r,
                          backgroundColor: BackgroundStatus(
                              widget.item!.OPERATION_STATUS)[1],
                          child: CircleAvatar(
                              radius: 55.r,
                              backgroundColor: BackgroundStatus(widget.item!
                                  .OPERATION_STATUS)[0],
                              child:
                              //Text('uwi',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.item!.UWI.toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,),
                                  Text(widget.item!.FACILITY_NAME.toString() +
                                      " - " +
                                      widget.item!.FACILITY_ID.toString(),
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,),
                                ],
                              ))
                      ),
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WellCompletionDetailPage(item: widget.item,),
                            settings: RouteSettings(
                                name: "Well_Completion_Detail"),

                          ),
                        );
                      },
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
                  GestureDetector(
                    child: Text(widget.item!.FIELD.toString(),
                        style: TextStyle(fontSize: 20.sp, color: Colors.blue)
                    ),
                    onTap: () async {
                      final String? uwi = await showCupertinoModalPopup(
                          context: context,
                          builder: (context) =>
                              Container(
                                height: 400,
                                padding: const EdgeInsets.only(top: 6.0),
                                margin: EdgeInsets.only(
                                  bottom: MediaQuery
                                      .of(context)
                                      .viewInsets
                                      .bottom,
                                ),
                                color: CupertinoColors.systemBackground
                                    .resolveFrom(context),
                                child: SafeArea(
                                  top: false,
                                  child: buildActionSheet(
                                      context, widget.wells,
                                      'FIELD',
                                      widget.item!.FIELD.toString()),
                                ),
                              )
                      );
                      //print(uwi!);
                    },
                  )
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
                        TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 0.02.sh),
                    GestureDetector(
                      child: Text(widget.item!.RESERVOIR_ID.toString(),
                        style: TextStyle(fontSize: 15.sp, color: Colors.blue),
                      ),
                      onTap: () async {
                        final String? uwi = await showCupertinoModalPopup(
                            context: context,
                            builder: (context) =>
                                Container(
                                  height: 400,
                                  padding: const EdgeInsets.only(top: 6.0),
                                  margin: EdgeInsets.only(
                                    bottom: MediaQuery
                                        .of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  color: CupertinoColors.systemBackground
                                      .resolveFrom(context),
                                  child: SafeArea(
                                    top: false,
                                    child: buildActionSheet(
                                        context, widget.wells,
                                        'RESERVOIR',
                                        widget.item!.RESERVOIR_ID.toString()),
                                  ),
                                )
                        );
                        //print(uwi!);
                      },
                    ),
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
                        TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 0.02.sh),
                    Text(widget.item!.CURRENT_STATUS.toString(),
                        textAlign: TextAlign.center,
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
                        TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold)),
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

  Widget buildActionSheet(BuildContext context, List<Well>? list,String? field, String item) {

      List<Result?> result = [];
      //String? field='';
      Result? r;

      try {
        for(int i=0;i<list!.length;i++) {
          if (field == 'RESERVOIR') {
            if (list[i].RESERVOIR_ID == item) {
              r = Result(
                  well_comp_s: list[i].WELL_COMPLETION_S,
                  uwi: list[i].UWI,
                  facility_name: list[i].FACILITY_NAME,
                  facility_id: list[i].FACILITY_ID);
              result.add(r);
            }

          } else if (field == 'AREA') {
            if (list[i].AREA == item) {
              r = Result(
                  well_comp_s: list[i].WELL_COMPLETION_S,
                  uwi: list[i].UWI,
                  facility_name: list[i].FACILITY_NAME,
                  facility_id: list[i].FACILITY_ID);
              result.add(r);
            }

          } else {
            if (list[i].FIELD == item) {
              r = Result(
                  well_comp_s: list[i].WELL_COMPLETION_S,
                  uwi: list[i].UWI,
                  facility_name: list[i].FACILITY_NAME,
                  facility_id: list[i].FACILITY_ID);
              result.add(r);
            }

          }
          if (field == item) {

            result.add(r);
          }
        }
        //  "RESERVOIR_ID='${widget.item!.RESERVOIR_ID}'";
        // AllWellsInReservoir = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
        // wellPostBody.whereCondition = "FIELD='${widget.item!.FIELD}'";
        // AllWellsInField = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
        // wellPostBody.whereCondition = "AREA='${widget.item!.AREA}'";
        // AllWellsInArea = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
        return CupertinoActionSheet(
          title: Text('Choose a well in ${item}'),
          actions: [
            CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 150,
                child: CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: _kItemExtent,
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int selectedItem) {
                    setState(() {
                      _selectedWellCompletion = selectedItem;
                      // print(selectedItem);
                    });
                  },
                  children:
                  List<Widget>.generate(result.length, (int index) {
                    return Center(
                      child: Text(
                        '${result[index]!.uwi} ${result[index]!.facility_name} - ${result[index]!.facility_id}',
                      ),
                    );
                  }),

                ),
              ),
            ),

          ],
          cancelButton: CupertinoActionSheetAction(
              child: Text('Get Well Details'),
              onPressed: () {
                int index = widget.wells!.indexWhere((e) => e.WELL_COMPLETION_S== result[_selectedWellCompletion]!.well_comp_s);
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WellPage(item: widget.wells![index],//item[index],
                          userPrivilege: widget.userPrivilege,
                          user: widget.user,
                          wells: widget.wells,),
                    settings: RouteSettings(name: "Well_Page"),
                  ),
                );
              } //Navigator.pop(context,AllWellsInReservoir![_selectedWellCompletion].UWI),
          ),
        );
      } catch (e) {
        SnackBar(
          content: Text(e.toString()),
        );
       return Center(child: Text('Something is messing, Please check with Support Application',style: TextStyle(color: Colors.black),),);
      }



   }
}
class Result {
  final String? well_comp_s;
  final String? uwi;
  final String? facility_name;
  final String? facility_id;
  Result({this.well_comp_s,this.uwi,this.facility_name,this.facility_id});

}
