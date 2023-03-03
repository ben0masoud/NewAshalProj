//import 'package:ashal_ver_3/daysContainer.dart';
import 'package:ashal_ver_3/production_history_detail_page.dart';
import 'package:ashal_ver_3/services/WellProduction.dart';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/well_complition_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'NavBar.dart';
import 'constant_values.dart';
import 'main.dart';

class ProductionHistoryPage extends StatefulWidget {

  // List<WellProduction?> ListItem;
 // WellProduction item;
  final String? item_uwi;
  final String? item_well_completion;
  final Well? item_well;
  List<String>? userPrivilege;
  final String? user;
  List<Well>? wells;



  ProductionHistoryPage({Key? key ,required this.item_uwi,required this.item_well_completion,this.item_well,this.userPrivilege,this.user,this.wells}) : super(key: key);

  @override
  _ProductionHistoryPageState createState() => _ProductionHistoryPageState();
}

class _ProductionHistoryPageState extends State<ProductionHistoryPage> {

  FetchDataApi fetchApi = FetchDataApi();
  BodyPost wellPostBody = BodyPost();

  @override

  Widget build(BuildContext context) {

    wellPostBody.user = widget.user;
    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion}'";
    wellPostBody.orderBy = "PRODUCTION_DATE DESC";

    return Scaffold(
      appBar: AppBar(

        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
        title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Production History',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text('${widget.item_well!.UWI} ${widget.item_well!.FACILITY_NAME} - ${widget.item_well!.FACILITY_ID}',
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
            Navigator.of(context).popUntil(ModalRoute.withName("wellcompletionlist"));
            //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>WellCompletionListPage(title: 'Flutter Demo Home Page')));
          },
        ),
      ),
      //drawer: NavBar(),
      endDrawer: NavBar(uwi: widget.item_uwi,well_completion: widget.item_well_completion,my_well: widget.item_well,userPrivilege: widget.userPrivilege,user:widget.user,wells: widget.wells,),

      body: Container(
      child: FutureBuilder(
        future: fetchApi.fetchWellProductionPost(wellPostBody),
        builder: (context, snapshot) {
          if(snapshot.data == null) {
            return Container(
              child: Center(
                child: Text('Loading...'),
              ),
            );
          } else {
            List<WellProduction>? ListProductionHistory = snapshot.data as List<WellProduction>?;
            DateTime dt1;
            String _production_date,_last_update ;
            return  (ListProductionHistory!.length > 0) ? ListView.builder(
              itemCount: ListProductionHistory!.length,
              itemBuilder: (context,int index) {
                if(ListProductionHistory[index].PRODUCTION_DATE.toString().isNotEmpty) {
                  dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
                      ListProductionHistory[index].PRODUCTION_DATE.toString());
                  _production_date =
                      DateFormat('dd/MM/yyyy hh:mm a').format(
                          dt1);
                }
                else
                {
                  _production_date ='';
                }
                if(ListProductionHistory[index].LAST_UPDATE.toString().isNotEmpty) {
                  dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(
                      ListProductionHistory[index].LAST_UPDATE.toString());
                  _last_update =
                      DateFormat('dd/MM/yyyy hh:mm a').format(
                          dt1);
                }
                else
                {
                  _last_update ='';
                }
                return ListTile(
                  leading:
                  Container(
                      //padding: EdgeInsets.all(20.r),
                      width: 0.15.sw,
                      height: 0.14.sh,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/Production/ProductionDays.png"), //assets/icons/Production/ProductionDays.png
                          //alignment: Alignment.center,
                          fit: BoxFit.fill,
                        )
                        ,
                      ),
                      child: Center(child: Text(ListProductionHistory[index].PRODUCTIVE_DAYS.toString(),style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold),))
                  ),
                  title:  Row(
                    children: [
                      Text("Started:",style: TextStyle(fontSize: 15.sp),),
                      SizedBox(width: 0.005.sw,),
                      Text(_production_date,style: TextStyle(fontSize: 13.sp),),
                    ],
                  ),
                  subtitle:  Row(
                      children: [
                      Text("Updated:",style: TextStyle(fontSize: 13.sp),),
                      SizedBox(width: 0.005.sw,),
                      Text(_last_update,style: TextStyle(fontSize: 12.sp),),
                  ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => ProductionHistoryDetailPage(item: ListProductionHistory[index])),
                    );
                  },
                  trailing: Icon(Icons.arrow_forward_ios),


                );
              },
            ) : Center(child: Text('No Data'),);
          };
        },
      ),
    ),
    );

  }
}
