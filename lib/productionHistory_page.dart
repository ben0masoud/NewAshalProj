//import 'package:ashal_ver_3/daysContainer.dart';
import 'package:ashal_ver_3/production_history_detail_page.dart';
import 'package:ashal_ver_3/services/WellProduction.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ProductionHistoryPage extends StatefulWidget {

  // List<WellProduction?> ListItem;
 // WellProduction item;
  String? item_uwi;
  String? item_well_completion;



  ProductionHistoryPage({Key? key ,required this.item_uwi,required this.item_well_completion}) : super(key: key);

  @override
  _ProductionHistoryPageState createState() => _ProductionHistoryPageState();
}

class _ProductionHistoryPageState extends State<ProductionHistoryPage> {
  @override
  FetchDataApi fetchApi = FetchDataApi();



  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text("Production History of ${widget.item_uwi!} "),
    ),
    body: Container(
      child: FutureBuilder(
        future: fetchApi.fetchWellProduction("::UWI='"+widget.item_uwi.toString()+"':PRODUCTION_DATE DESC"),
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
            return ListView.builder(
              itemCount: ListProductionHistory!.length,
              itemBuilder: (context,int index) {
                if(ListProductionHistory[index].PRODUCTION_DATE.toString().isNotEmpty) {
                  dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(
                      ListProductionHistory[index].PRODUCTION_DATE.toString());
                  _production_date =
                      DateFormat('dd/MM/yyyy h:mm a').format(
                          dt1);
                }
                else
                {
                  _production_date ='';
                }
                if(ListProductionHistory[index].LAST_UPDATE.toString().isNotEmpty) {
                  dt1 = DateFormat('MM/dd/yyyy hh:mm').parse(
                      ListProductionHistory[index].LAST_UPDATE.toString());
                  _last_update =
                      DateFormat('dd/MM/yyyy h:mm a').format(
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

                );
              },
            );
          };
        },
      ),
    ),
    );

  }
}
