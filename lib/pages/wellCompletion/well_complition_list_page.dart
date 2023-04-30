
import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/constant_values.dart';
import 'all_area.dart';
import 'n_area.dart';
import 'o_area.dart';
import 's_area.dart';
import 'w_area.dart';
import '../../services/body_post_json.dart';
import '../../services/fetchDataApi.dart';
import '../../services/well.dart';

class WellCompletionListPage extends StatefulWidget {
   WellCompletionListPage({Key? key, required this.title,this.user, this.profile,this.AshalAccess,this.Gc,this.Area}) : super(key: key);
  final String title;
  final String? user;
  final String? profile;
  final List<String>? AshalAccess;
  final String? Gc;
  final String? Area;

  @override
  State<WellCompletionListPage> createState() => _WellCompletionListPageState();
}

class _WellCompletionListPageState extends State<WellCompletionListPage> {
  late List<Well?> wells = [];
  late List<Well?> wellsSearch = [];
  String query = '';
  late List<Well>? AllWells = [];
  late List<Well>? nkData = [];
  late List<Well>? wkData = [];
  late List<Well>? skData = [];
  late List<Well>? otherData = [];
  int index = 0;
  late List screens;
  late int selectedPage = 0;
  bool isLoad=false;
  FetchDataApi fetchApi = FetchDataApi();
  BodyPost wellPostBody = BodyPost();

  @override
  void initState() {

    fetchWellCompletion();

  }

  //AllWells = GetData(widget.profile!,widget.AshalAccess!);
  //FetchDataApi fetchApi = FetchDataApi();

  Future fetchWellCompletion() async {

    AllWells = [];
    nkData = [];
    wkData = [];
    screens = [];
    selectedPage = 0;
    wellsSearch = wells;
    setState(() {
      isLoad=false;
    });


    wellPostBody.user =widget.user!;
    wellPostBody.orderBy = "UWI";
    // AllWells = await fetchApi.fetchWellPost(wellPostBody);

    //final String response = await rootBundle.loadString('assets/well_completion.json');
    try {
      // print('the response is '+response.statusCode.toString());
      AllWells!.clear();
      if (widget.profile!.toUpperCase() == 'wellcompletionlist'.toUpperCase()) {
        if (widget.Area! == 'ALL AREA') {
          //AllWells = await fetchApi.fetchWell('') as List<Well>?;

          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
        } else {
          wellPostBody.whereCondition = "AREA='${widget.Area!}'";
          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
          //AllWells = await fetchApi.fetchWell("::AREA='${access}'") as List<Well>?;
        }
      } else if(widget.profile!.toUpperCase() =='gcList'.toUpperCase())
      {
        if (widget.Area!.toUpperCase() == 'ALL AREA'.toUpperCase()) {
          wellPostBody.whereCondition = "GC='${widget.Gc}'";
          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
          //AllWells = await fetchApi.fetchWell("::GC='${widget.Gc}'") as List<Well>?;
        } else {
          wellPostBody.whereCondition = "AREA='${widget.Area!}' AND GC='${widget.Gc}'";
          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
          //   AllWells = await fetchApi.fetchWell("::AREA='${access}' AND GC='${widget.Gc}'") as List<Well>?;
        }
      }
      else
        AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
      // AllWells = await fetchApi.fetchWell('') as List<Well>?;
      setState(() {

        if (AllWells!.isNotEmpty) {

          selectedPage = 0;
          //  print('AllWells = ${AllWells!.length}');
          nkData = AllWells!.where((e) => e.ACTUAL_AREA == "NK").toList();
          //  print('nkData = ${nkData!.length}');
          wkData = AllWells!.where((e) => e.ACTUAL_AREA == "WK").toList();
          //  print('wkData = ${wkData!.length}');
          skData = AllWells!.where((e) => e.ACTUAL_AREA == "SEK").toList();
          //  print('skData = ${skData!.length}');
          otherData = AllWells!
              .where((e) => e.ACTUAL_AREA != "SEK" && e.ACTUAL_AREA != "WK" && e.ACTUAL_AREA != "NK")
              .toList();
          // print('otherData = ${otherData!.length}');



        }
        screens = [
          AllArea(
            wellList: AllWells,
            userPrivilege: widget.AshalAccess,
            user: widget.user,
          ),
          NArea(
            wellList: nkData,
            userPrivilege: widget.AshalAccess,
            user: widget.user,
          ),
          SArea(
            wellList: skData,
            userPrivilege: widget.AshalAccess,
            user: widget.user,
          ),
          WArea(
            wellList: wkData,
            userPrivilege: widget.AshalAccess,
            user: widget.user,
          ),
          OArea(
            wellList: otherData,
            userPrivilege: widget.AshalAccess,
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
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ConstantValues.MainColor1,

          title: Text('Well Completion List',style: TextStyle(color: Colors.black),),
        ),

        body: isLoad
            ? RefreshIndicator(
            child: screens[selectedPage],
            onRefresh: fetchWellCompletion
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
                counter: AllWells!.length,
                child:  ImageIcon(
                  AssetImage('assets/icons/Center-Direction-icon.png'),
                  size: 32,
                ),
              ), //Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Nk',
              icon: buildCustomBadget(
                counter: nkData!.length,
                child:  ImageIcon(
                  AssetImage('assets/icons/North-Direction-icon.png'),
                  size: 32,
                ),
              ), //Icon(Icons.favorite),

            ),
            BottomNavigationBarItem(
              label: 'WK',
              icon: buildCustomBadget(
                counter: wkData!.length,
                child:  ImageIcon(
                  AssetImage('assets/icons/West-Direction-icon.png'),
                  size: 32,
                ),
              ), //Icon(Icons.favorite),

            ),
            BottomNavigationBarItem(
              label: 'SEK',
              icon: buildCustomBadget(
                counter: skData!.length,
                child:  ImageIcon(
                  AssetImage('assets/icons/South-Direction-icon.png'),
                  size: 32,
                ),
              ), //Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "Other",//Data!.length.toString(),
              icon: buildCustomBadget(
                counter: otherData!.length,
                child:  ImageIcon(
                  AssetImage('assets/icons/East-Direction-icon.png'),
                  size: 32,
                ),
              ),
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
