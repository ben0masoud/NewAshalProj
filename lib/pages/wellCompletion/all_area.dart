

import 'package:flutter/material.dart';
import '../../services/well.dart';
import '../../well_page.dart';
import '../../widgets/search_widget.dart';
import '../../widgets/well_completion_main_info.dart';

class AllArea extends StatefulWidget {
   AllArea({Key? key,required this.wellList,this.userPrivilege,this.user}) : super(key: key);

  final List<Well>? wellList;
   List<String>? userPrivilege;
   final String? user;

  @override
  State<AllArea> createState() => _AllAreaState();
}

class _AllAreaState extends State<AllArea> {
  @override
  String query='';
  late  List<Well>? wellsSearch = [];

  void initState(){
    super.initState();
    wellsSearch = widget.wellList;
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
            widget.wellList!.length > 0

                ? Expanded(
              child: ListView.builder(
                itemCount: (wellsSearch == null) ? 0 : wellsSearch!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(2),
                    child:GestureDetector(
                            child: WellCompletionMainInfo(
                                wellStatus: wellsSearch![index].OPERATION_STATUS,
                                uwi: wellsSearch![index].UWI,
                                facilityNameID: "${wellsSearch![index].FACILITY_NAME}-${wellsSearch![index].FACILITY_ID}",
                                currentStatue: wellsSearch![index].CURRENT_STATUS,
                                leftMethod: wellsSearch![index].LIFT_METHOD,
                                 end_time: wellsSearch![index].END_TIME,),
                      onTap: () {

                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => WellPage(item: wellsSearch![index],userPrivilege: widget.userPrivilege,user: widget.user,),
                            settings: RouteSettings(name: "Well_Page"),

                          ),
                        );
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
      onChanged: searchWell,
      hintText: 'Type Well'
  );

  void searchWell(String query) {
    final wellsSearch =widget.wellList!.where((w)  {
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
