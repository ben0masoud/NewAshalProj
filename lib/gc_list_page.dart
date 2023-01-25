
import 'dart:io';

import 'package:ashal_ver_3/pages/gc_list/all_area_gcs.dart';
import 'package:ashal_ver_3/pages/gc_list/n_area_gcs.dart';
import 'package:ashal_ver_3/pages/gc_list/o_area_gcs.dart';
import 'package:ashal_ver_3/pages/gc_list/s_area_gcs.dart';
import 'package:ashal_ver_3/pages/gc_list/w_area_gcs.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/production_facility.dart';
import 'package:flutter/material.dart';

class GcListPages extends StatefulWidget {
  const GcListPages({Key? key,required this.title,this.profile,this.AshalAccess,this.Area}) : super(key: key);
  final String title;
  final String? profile;
  final List<String>? AshalAccess;
  final String? Area;

  @override
  State<GcListPages> createState() => _GcListPagesState();
}

class _GcListPagesState extends State<GcListPages> {

  late List<ProductionFacility?> gcs = [];
  late List<ProductionFacility?> gcsSearch = [];
  String query = '';
  late List<ProductionFacility>? AllGcs = [];
  late List<ProductionFacility>? nkData = [];
  late List<ProductionFacility>? wkData = [];
  late List<ProductionFacility>? skData = [];
  late List<ProductionFacility>? otherData = [];
  int index = 0;
  late List screens;
  late int selectedPage = 0;

  @override

  void initState() {
    AllGcs = [];
    nkData = [];
    wkData = [];
    screens = [];
    selectedPage = 0;
    super.initState();
    gcsSearch = gcs;
    fetchGCList(widget.profile!, widget.Area!);
  }

  //AllWells = GetData(widget.profile!,widget.AshalAccess!);
  //FetchDataApi fetchApi = FetchDataApi();

  Future fetchGCList(String prof, String access) async {
    FetchDataApi fetchApi = FetchDataApi();
    //final String response = await rootBundle.loadString('assets/well_completion.json');
    try {
      // print('the response is '+response.statusCode.toString());
      AllGcs!.clear();

      if (access == 'ALL AREA') {
        AllGcs = await fetchApi.fetchProductFacility('') as List<ProductionFacility>?;
      } else {
        AllGcs =
        await fetchApi.fetchProductFacility("::OPERATOR='${access}'") as List<ProductionFacility>?;
      }


      if (AllGcs!.isNotEmpty) {
        setState(() {
          selectedPage = 0;
          //  print('AllWells = ${AllWells!.length}');
          nkData = AllGcs!.where((e) => e.OPERATOR == "NK").toList();
          //  print('nkData = ${nkData!.length}');
          wkData = AllGcs!.where((e) => e.OPERATOR == "WK").toList();
          //  print('wkData = ${wkData!.length}');
          skData = AllGcs!.where((e) => e.OPERATOR == "SK").toList();
          //  print('skData = ${skData!.length}');
          otherData = AllGcs!
              .where((e) => e.OPERATOR != "SK" && e.OPERATOR != "WK" && e.OPERATOR != "NK")
              .toList();

          screens = [
            AllAreaGCs(
              gcList: AllGcs,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
            ),
            NAreaGCs(
              gcList: nkData,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
            ),
            SAreaGCs(
              gcList: skData,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
            ),
            WAreaGCs(
              gcList: wkData,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
            ),
            OAreaGCs(
              gcList: otherData,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
            )
          ];
        });
      }

    } on SocketException catch (e) {
      print('e is ${e.osError}');
      return null;
    }
  }

  Widget build(BuildContext context) {
    //FetchDataApi fetchApi = FetchDataApi();
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Read Data From Local Json',
          ),
        ),
        body: AllGcs!.isNotEmpty
            ? screens[selectedPage]
            : Center(child: CircularProgressIndicator()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF6200EE),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            // Respond to item press.
            setState(() => selectedPage = value);
          },
          items: [
            BottomNavigationBarItem(
                label: 'All', //AllWells!.length.toString(),
                icon: buildCustomBadget(
                    counter: AllGcs!.length,
                    child:  ImageIcon(
                      AssetImage('assets/icons/Center-Direction-icon.png'),
                      size: 32,
                    )
                )
              //Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
                label: nkData!.length.toString(),
                icon: ImageIcon(
                  AssetImage('assets/icons/North-Direction-icon.png'),
                  size: 32,
                ) //Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
                label: skData!.length.toString(),
                icon: ImageIcon(
                  AssetImage('assets/icons/South-Direction-icon.png'),
                  size: 32,
                ) //Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
                label: wkData!.length.toString(),
                icon: ImageIcon(
                  AssetImage('assets/icons/West-Direction-icon.png'),
                  size: 32,
                ) //Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
                label: otherData!.length.toString(),
                icon: ImageIcon(
                  AssetImage('assets/icons/Center-Direction-icon.png'),
                  size: 32,
                ) //Icon(Icons.ac_unit_sharp),
            ),
          ],
        ));
  }
  Widget buildCustomBadget({required int counter,required Widget child}) {
    final text = counter.toString();
    final deltaFontSize = (text.length -1) * 3.0;
    return Stack(
      clipBehavior:Clip.none,
      children: [
        child,
        Positioned(
            top: -6,
            right: -20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 10,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16 - deltaFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
            )
        )
      ],
    );
  }
}
