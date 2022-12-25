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
                  leading:  Container(
                    width: 0.2.sw,
                    height: 0.14.sh,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          topLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r),
                        ),
                        border: Border.all(color: Colors.black,width: 2),
                        //boxShadow: BoxShadow(blurRadius: ),

                    ),
                    child: Column(

                      children: [
                        Container(
                          height: 0.026.sh,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              topLeft: Radius.circular(8.r),

                            ),
                          ),
                          child: Text(
                            "Days",
                            textAlign: TextAlign.center,
                            //overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp  ,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ),
                        Container(
                          //alignment: Alignment.center,
                          // padding: EdgeInsets.fromLTRB(2, 10, 2, 2),
                          margin: EdgeInsets.only(top: 5.r),
                          width: 0.18.sw,//double.infinity,
                          height: 0.03.sh,
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          child: Center(
                            child: Text(
                              ListProductionHistory[index].PRODUCTIVE_DAYS.toString(),
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp  ,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
