import 'package:ashal_ver_3/WellTest_Container.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:ashal_ver_3/well_test_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AllWellTestHistoryPage extends StatefulWidget {

   Well? item_well;
  final List<WellTest>? ListWellTestHistory;


  AllWellTestHistoryPage({Key? key, required this.ListWellTestHistory,this.item_well}) : super(key: key);

  @override
  State<AllWellTestHistoryPage> createState() => _AllWellTestHistoryPageState();
}

class _AllWellTestHistoryPageState extends State<AllWellTestHistoryPage> {


  @override

/*
  Future<List<WellTest>?> _fetchData() async {
    FetchDataApi fetchApi = FetchDataApi();
    BodyPost wellPostBody = BodyPost();
    wellPostBody.user =widget.user;
    wellPostBody.whereCondition = "WELL_COMPLETION_S='${widget.item_well_completion!}'";
    wellPostBody.orderBy = "START_TIME DESC";

    //results = await fetchApi.fetchWellTest(":20:WELL_COMPLETION_S='" + widget.item_well_completion! + "' AND ACTIVITY_NAME='PORTABLE' AND PREFFERED_FLAG='Y':START_TIME DESC");
    var _results = await fetchApi.fetchWellTestPost(wellPostBody);

    //List<WellTest>? ListWellTestHistory = results;
    return _results;// as List<WellTest>?;
  }
*/
  @override
  Widget build(BuildContext context) {

    return buildCompanyCard(widget.ListWellTestHistory,widget.item_well);
  }
}
Widget buildCompanyCard(List<WellTest>? lists, Well? well) {

  DateTime dt1 ,dt2;
  String _start_time,_end_time;

  if (lists!.length > 0) {
    return ListView.builder(
      itemCount: lists.length,
      itemBuilder: (context, int i) {
        final list = lists[i];
        if (list
            .START_TIME
            .toString()
            .isNotEmpty) {
          var inputFormat = DateFormat('MM/dd/yyyy HH:mm:ss a');
          dt1 = inputFormat.parse(list.START_TIME!);
          var outputFormat = DateFormat('dd/MM/yyyy hh:mm a');
          _start_time = outputFormat.format(dt1);
        } else {
          _start_time = '';
        }
        //print('well test page start time = '+_start_time);
        if (list
            .END_TIME
            .toString()
            .isNotEmpty) {
          dt2 = DateFormat('MM/dd/yyyy hh:mm:ss a')
              .parse(list.END_TIME.toString());
          _end_time = DateFormat('dd/MM/yyyy hh:mm a').format(dt2);
        } else {
          _end_time = '';
        }
        // print('well test page end time = '+_end_time);
        //print(_end_time);
        return GestureDetector(

          //behavior: HitTestBehavior.opaque,
          child: WellTestContainer(
            Duration:
            list.DURATION.toString(),
            StartTime: _start_time,
            EndTime: _end_time,
            ID: list.ACTIVITY_ID.toString(),
            ActivityName:
            list.ACTIVITY_NAME.toString(),
            ActivityType: list
                .ACTIVITY_TYPE
                .toString(),
          ),
          onTap: () {
            print('it pressed');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WellTestDetails(
                  ListWellTest: list,
                  item_well: well,
                ),
              ),
            );
          },
        );
      },
    );
  } else
  {
    return Center(child: Text('No data',style: TextStyle(fontSize: 15),),);
  }

}
