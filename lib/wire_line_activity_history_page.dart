import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wirelineActivity.dart';
import 'package:ashal_ver_3/wire_line_activity_history_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'NavBar.dart';
import 'main.dart';

class WireLineActivityHistoryPage extends StatefulWidget {
  String? item_uwi;
  String? item_well_completion;
  Well? item_well;

  WireLineActivityHistoryPage(
      {Key? key, required this.item_uwi, required this.item_well_completion,this.item_well})
      : super(key: key);

  @override
  State<WireLineActivityHistoryPage> createState() =>
      _WireLineActivityHistoryPageState();
}

class _WireLineActivityHistoryPageState
    extends State<WireLineActivityHistoryPage> {
  @override
  FetchDataApi fetchApi = FetchDataApi();
  List<String?> OilCompany = [
    'FPS',
    'EXPERTEST',
    'BJ',
    'GDMC',
    'GOFSC',
    'GOFSCO',
    'HLS',
    'NPSC',
    'SLB',
    'SPETCO',
    'WeatherFord'
  ];

  Widget buildCompanyCard(List<WirelineActivity?> list, int i) {

    DateTime dt1 = DateFormat('MM/dd/yyyy hh:mm').parse( list[i]!.START_TIME.toString());
    String _start_time = DateFormat('dd/MM/yyyy h:mm a').format(dt1);

    return GestureDetector(
      onTap: (){
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WireLineActivityHistoryDetialPage(
                        item: list[i])),
          );
        }
      },
      child: Padding(
        padding:  EdgeInsets.all(5.r),
        child: Card(
          child: Padding(
            padding:  EdgeInsets.all(5.r),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Image.asset(
                        //'assets/no-image-available.jpeg',
                        OilCompany.indexOf(list[i]!.CONTRACTOR) >
                                -1 //where((item) => item == list[i]!.CONTRACTOR)
                            ? 'assets/company/${list[i]!.CONTRACTOR}.png'
                            : 'assets/company/NoLogo.png',
                        height: 0.15.sh,
                        width: 0.3.sw,
                        fit: BoxFit.fitWidth,
                      ),
                      Text(list[i]!.CONTRACTOR.toString(),style: TextStyle(fontSize: 15.sp),)
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Text(
                        list[i]!.ACTIVITY_NAME.toString(),
                        style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Text(
                        list[i]!.STATUS.toString(),
                        style:
                            TextStyle(fontSize: 15.sp, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Text(
                        _start_time,
                        style:
                            TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    //final List<WirelineActivity?> ListWirelineActivityHistory = [];
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0.24.sw,
        leading: GestureDetector(
          child: Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  //Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Flutter Demo Home Page')));
                  Navigator.of(context).popUntil(ModalRoute.withName("Home"));
                },
                label: Text("Wells",style: TextStyle(fontSize: 12.sp,color: Colors.blue),),
                icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.blue,),)
              //Icon(Icons.arrow_back_ios_outlined),
              // Text("Wells",style: TextStyle(fontSize: 10.sp),),
            ],
          ),
          onTap: () {
            Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyHomePageWithPages(title: 'Flutter Demo Home Page')));
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: (){
                  Scaffold.of(context).openEndDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                icon: Icon(Icons.menu),

                color: Colors.blue,
              );
            },
          ),
        ],
        title: Center(
          child: Column(
            children: [
              Text(
                "Well Activity",style: TextStyle(color: Colors.black,fontSize: 14.sp,fontWeight: FontWeight.bold),
              ),
              Text(
                widget.item_uwi!,style: TextStyle(color: Colors.black,fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
      //drawer: NavBar(),
      endDrawer: NavBar(
          uwi: widget.item_uwi, well_completion: widget.item_well_completion),
      body: Container(
        child: FutureBuilder(
          future: fetchApi.fetchWirelineActivity(
              "::UWI='" + widget.item_uwi.toString() + "':START_TIME DESC"),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else {
              List<WirelineActivity?> ListWirelineActivityHistory =
                  snapshot.data as List<WirelineActivity?>;
              return ListView.builder(
                  itemCount: (ListWirelineActivityHistory == null)
                      ? 0
                      : ListWirelineActivityHistory.length,
                  itemBuilder: (context, int index) {
                    return buildCompanyCard(ListWirelineActivityHistory, index);
                    /*
                                        ListTile(
                                          leading:  Container(
                                            //alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                              //Icon(Icons.circle,color:Colors.green),
                                              //Image(image: AssetImage('assets/no-image-available.jpeg')),
                                              Image.asset(
                                                  //'assets/no-image-available.jpeg',
                                                OilCompany.contains(ListWirelineActivityHistory[index]!.CONTRACTOR)
                                                    ? 'assets/company/${ListWirelineActivityHistory[index]!.CONTRACTOR}.png'
                                                    : 'assets/company/NoLogo.png',
                                                   height: 50,
                                                   width:  50,
                                                   fit: BoxFit.fitWidth,
                                              ),
                                              Text(ListWirelineActivityHistory[index]!.CONTRACTOR.toString())
                                              ],
                                            ),
                                          ),
                                        title: Column(
                                          children: [
                                            Text(ListWirelineActivityHistory[index]!.ACTIVITY_NAME.toString()),
                                            Text(ListWirelineActivityHistory[index]!.STATUS.toString())
                                          ],
                                        ),
                                        subtitle: Text(ListWirelineActivityHistory[index]!.START_TIME.toString()),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder:
                                                (context) => WireLineActivityHistoryDetialPage(item: ListWirelineActivityHistory[index])),
                                          );
                                        },
                                      );
                                        */
                  });
            }
            ;
          },
        ),
      ),
    );
  }
}
