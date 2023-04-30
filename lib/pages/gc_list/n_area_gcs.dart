import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/constant_values.dart';
import '../../main.dart';
import '../../services/production_facility.dart';
import '../../widgets/search_widget.dart';
import '../wellCompletion/well_complition_list_page.dart';

class NAreaGCs extends StatefulWidget {
  const NAreaGCs({Key? key,this.gcList,this.profile,this.AshalAccess,this.Area,this.user}) : super(key: key);

  final List<ProductionFacility>? gcList;
  final String? profile;
  final List<String>? AshalAccess;
  final String? Area;
  final String? user;

  @override
  State<NAreaGCs> createState() => _NAreaGCsState();
}

class _NAreaGCsState extends State<NAreaGCs> {
  @override
  String query='';
  late  List<ProductionFacility>? gcsSearch = [];

  void initState(){
    super.initState();
    gcsSearch = widget.gcList;
  }
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Display the data loaded from data.json
            buildSearch(),
            widget.gcList!.isNotEmpty

                ? Expanded(
              child: ListView.builder(
                itemCount: (gcsSearch == null) ? 0 : gcsSearch!.length,
                itemBuilder: (context, index) {
                  DateTime dt1;
                  String SDate="";
                  String EDate="";
                  String rmk="";

                  if(gcsSearch![index].START_DATE!.isNotEmpty) {
                    dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(gcsSearch![index].START_DATE!);
                    SDate = DateFormat('dd/MM/yyyy').format(dt1);
                  }
                  if(gcsSearch![index].END_DATE!.isNotEmpty) {
                    dt1 = DateFormat('MM/dd/yyyy hh:mm:ss a').parse(gcsSearch![index].END_DATE!);
                    EDate = DateFormat('dd/MM/yyyy').format(dt1);
                  }


                  return Card(
                    margin: const EdgeInsets.all(5),
                    child:GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  child: Column(
                                    children: [
                                      Text("Start Date",style: TextStyle(fontSize: 12),),
                                      Text(SDate,style: TextStyle(fontSize: 12),),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 160,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                                            color: ConstantValues.MainColor2,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              children: [
                                                Text(gcsSearch![index].GC.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                                Text('Name: ${gcsSearch![index].NAME}',style: TextStyle(fontSize: 12,color: Colors.white),),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  child: Column(
                                    children: [
                                      Text("End Date",style: TextStyle(fontSize: 12),),
                                      Text(EDate,style: TextStyle(fontSize: 12),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            (gcsSearch![index].REMARKS!.isNotEmpty) ?
                            Text('Remarks: ${gcsSearch![index].REMARKS}',style: TextStyle(fontSize: 10),) :
                            Text("")
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            settings: RouteSettings(name: "wellcompletionlist"),
                            builder: (context) =>
                                WellCompletionListPage(title: 'Flutter Demo Home Page',
                                  profile: widget.profile!,
                                  AshalAccess: widget.AshalAccess,
                                  Area: widget.Area,
                                  Gc: gcsSearch![index].GC,
                                  user: widget.user,
                                )));

                      },
                    ),
                  );
                },
              ),
            )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
  Widget buildSearch() => SearchWidget(
      text: query,
      onChanged: searchGc,
      hintText: 'Type Gc'
  );

  void searchGc(String query) {
    final gcsSearch =widget.gcList!.where((w)  {
      final gcLower = w!.GC!.toLowerCase();
      final searchLower = query.toLowerCase();
      return gcLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.gcsSearch = gcsSearch;
    });
  }
}
