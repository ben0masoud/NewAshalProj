import 'package:flutter/material.dart';

import '../../services/well.dart';
import '../../well_page.dart';
import '../../widgets/search_widget.dart';
import '../../widgets/well_completion_main_info.dart';
class SArea extends StatefulWidget {
   SArea({Key? key,required this.wellList}) : super(key: key);
  final List<Well>? wellList;
  @override
  State<SArea> createState() => _SAreaState();
}

class _SAreaState extends State<SArea> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the data loaded from data.json
            buildSearch(),
            widget.wellList!.isNotEmpty

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
                          leftMethod: wellsSearch![index].LIFT_METHOD),
                      onTap: () {

                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => WellPage(item: wellsSearch![index]),
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
