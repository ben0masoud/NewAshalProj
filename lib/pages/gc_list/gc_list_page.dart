
import 'dart:io';

import 'package:ashal_ver_3/pages/gc_list/all_area_gcs.dart';
import 'package:ashal_ver_3/pages/gc_list/n_area_gcs.dart';
import 'package:ashal_ver_3/pages/gc_list/o_area_gcs.dart';
import 'package:ashal_ver_3/pages/gc_list/s_area_gcs.dart';
import 'package:ashal_ver_3/pages/gc_list/w_area_gcs.dart';
import 'package:ashal_ver_3/services/body_post_json.dart';
import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/production_facility.dart';
import 'package:flutter/material.dart';

import '../../services/constant_values.dart';

class GcListPages extends StatefulWidget {
  const GcListPages({Key? key,required this.title,this.user,this.profile,this.AshalAccess,this.Area}) : super(key: key);
  final String title;
  final String? user;
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
  bool isLoad=false;

  @override

  void initState() {
   // AllGcs = [];
   // nkData = [];
   // wkData = [];
   // screens = [];
   // selectedPage = 0;
    super.initState();
   // gcsSearch = gcs;
  //  setState(() {
  //    isLoad=false;
  //  });
    fetchGCList();
  }

  //AllWells = GetData(widget.profile!,widget.AshalAccess!);
  //FetchDataApi fetchApi = FetchDataApi();

  Future fetchGCList() async {
    AllGcs = [];
    nkData = [];
    wkData = [];
    screens = [];
    selectedPage = 0;
    gcsSearch = gcs;
    setState(() {
      isLoad=false;
    });
    FetchDataApi fetchApi = FetchDataApi();
    BodyPost wellPostBody = BodyPost();
    wellPostBody.user = widget.user;
    wellPostBody.orderBy = "GC";

    // wellPostBody.orderBy = "START_TIME DESC";
    //final String response = await rootBundle.loadString('assets/well_completion.json');
    try {
      // print('the response is '+response.statusCode.toString());
      AllGcs!.clear();

      if (widget.Area! == 'ALL AREA') {
        //AllGcs = await fetchApi.fetchProductFacility('') as List<ProductionFacility>?;
        AllGcs = await fetchApi.fetchProductFacilityPost(wellPostBody) as List<ProductionFacility>?;
      } else {
        wellPostBody.whereCondition = "AREA='${widget.Area!}'";
        //AllGcs = await fetchApi.fetchProductFacility("::OPERATOR='${access}'") as List<ProductionFacility>?;
        AllGcs = await fetchApi.fetchProductFacilityPost(wellPostBody) as List<ProductionFacility>?;
      }


        setState(() {
          if (AllGcs!.isNotEmpty) {
            selectedPage = 0;
          //  print('AllWells = ${AllWells!.length}');
            nkData = AllGcs!.where((e) => e.ACTUAL_AREA == "NK").toList();
          //  print('nkData = ${nkData!.length}');
            wkData = AllGcs!.where((e) => e.ACTUAL_AREA == "WK").toList();
          //  print('wkData = ${wkData!.length}');
            skData = AllGcs!.where((e) => e.ACTUAL_AREA == "SEK").toList();
          //  print('skData = ${skData!.length}');
            otherData = AllGcs!.where((e) => e.ACTUAL_AREA != "SEK" && e.ACTUAL_AREA != "WK" && e.ACTUAL_AREA != "NK").toList();
        }
          screens = [
            AllAreaGCs(
              gcList: AllGcs,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
              Area: widget.Area,
              user: widget.user,
            ),
            NAreaGCs(
              gcList: nkData,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
              Area: widget.Area,
              user: widget.user,
            ),
            WAreaGCs(
              gcList: wkData,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
              Area: widget.Area,
              user: widget.user,
            ),
            SAreaGCs(
              gcList: skData,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
              Area: widget.Area,
              user: widget.user,
            ),
            OAreaGCs(
              gcList: otherData,
              profile: widget.profile,
              AshalAccess: widget.AshalAccess,
              Area: widget.Area,
              user: widget.user,
            )
          ];
          isLoad=true;
        });

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
          backgroundColor: ConstantValues.MainColor1,
          title: Text('GC List',style: TextStyle(color: Colors.black),),
        ),
        body: isLoad
            ? RefreshIndicator(
            child: screens[selectedPage],
            onRefresh: fetchGCList
        )
            : Center(child: CircularProgressIndicator()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ConstantValues.MainColor1,//ThemeData().primaryColor,//Color(0xFF6200EE),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 16,
          unselectedFontSize: 16,
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
                label: 'NK',
                icon: buildCustomBadget(
                counter: nkData!.length,
                child:  ImageIcon(
                  AssetImage('assets/icons/North-Direction-icon.png'),
                  size: 32,
                )
            )//Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
                label: 'WK',
                icon: buildCustomBadget(
                counter: wkData!.length,
                child:  ImageIcon(
                  AssetImage('assets/icons/West-Direction-icon.png'),
                  size: 32,
                )
            )//Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
                label: 'SEK',
                icon: buildCustomBadget(
                        counter: skData!.length,
                        child:  ImageIcon(
                        AssetImage('assets/icons/South-Direction-icon.png'),
                        size: 32,
                        ),
                ),//Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
                label: 'Other',
                icon: buildCustomBadget(
                        counter: otherData!.length,
                        child:  ImageIcon(
                        AssetImage('assets/icons/East-Direction-icon.png'),
                        size: 32,
                        ),
                ),//Icon(Icons.ac_unit_sharp),
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
