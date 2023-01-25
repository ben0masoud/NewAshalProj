

import 'package:flutter/material.dart';

import '../../main.dart';
import '../../services/production_facility.dart';
import '../../widgets/search_widget.dart';


class WAreaGCs extends StatefulWidget {
  WAreaGCs({Key? key,required this.gcList,this.profile,this.AshalAccess,this.Area}) : super(key: key);

  final List<ProductionFacility>? gcList;
  final String? profile;
  final List<String>? AshalAccess;
  final String? Area;


  @override
  State<WAreaGCs> createState() => _WAreaGCsState();
}

class _WAreaGCsState extends State<WAreaGCs> {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the data loaded from data.json
            buildSearch(),
            widget.gcList!.isNotEmpty

                ? Expanded(
              child: ListView.builder(
                itemCount: (gcsSearch == null) ? 0 : gcsSearch!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child:GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(gcsSearch![index].GC.toString(),style: TextStyle(fontSize: 20),),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            settings: RouteSettings(name: "Home"),
                            builder: (context) =>
                                MyHomePageWithPages(title: 'Flutter Demo Home Page',
                                  profile: widget.profile!,
                                  AshalAccess: widget.AshalAccess,
                                  Area: widget.Area,
                                  Gc: gcsSearch![index].GC,
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
