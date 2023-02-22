
import 'dart:io';

import 'package:flutter/material.dart';

import 'constant_values.dart';
import 'pages/wellCompletion/all_area.dart';
import 'pages/wellCompletion/n_area.dart';
import 'pages/wellCompletion/o_area.dart';
import 'pages/wellCompletion/s_area.dart';
import 'pages/wellCompletion/w_area.dart';
import 'services/body_post_json.dart';
import 'services/fetchDataApi.dart';
import 'services/well.dart';

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

  @override
  void initState() {
    AllWells = [];
    nkData = [];
    wkData = [];
    screens = [];
    selectedPage = 0;
    super.initState();
    wellsSearch = wells;
    setState(() {
      isLoad=false;
    });
    fetchWellCompletion(widget.profile!, widget.Area!,widget.user!);

  }

  //AllWells = GetData(widget.profile!,widget.AshalAccess!);
  //FetchDataApi fetchApi = FetchDataApi();

  Future fetchWellCompletion(String prof, String access,String user) async {
    FetchDataApi fetchApi = FetchDataApi();

    BodyPost wellPostBody = BodyPost();
    wellPostBody.user =user;
    wellPostBody.orderBy = "UWI";
    // AllWells = await fetchApi.fetchWellPost(wellPostBody);

    //final String response = await rootBundle.loadString('assets/well_completion.json');
    try {
      // print('the response is '+response.statusCode.toString());
      AllWells!.clear();
      if (prof.toUpperCase() == 'wellcompletionlist'.toUpperCase()) {
        if (access == 'ALL AREA') {
          //AllWells = await fetchApi.fetchWell('') as List<Well>?;

          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
        } else {
          wellPostBody.whereCondition = "AREA='${access}'";
          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
          //AllWells = await fetchApi.fetchWell("::AREA='${access}'") as List<Well>?;
        }
      } else if(prof.toUpperCase() =='gcList'.toUpperCase())
      {
        if (access.toUpperCase() == 'ALL AREA'.toUpperCase()) {
          wellPostBody.whereCondition = "GC='${widget.Gc}'";
          AllWells = await fetchApi.fetchWellPost(wellPostBody) as List<Well>?;
          //AllWells = await fetchApi.fetchWell("::GC='${widget.Gc}'") as List<Well>?;
        } else {
          wellPostBody.whereCondition = "AREA='${access}' AND GC='${widget.Gc}'";
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
          nkData = AllWells!.where((e) => e.AREA == "NK").toList();
          //  print('nkData = ${nkData!.length}');
          wkData = AllWells!.where((e) => e.AREA == "WK").toList();
          //  print('wkData = ${wkData!.length}');
          skData = AllWells!.where((e) => e.AREA == "SK").toList();
          //  print('skData = ${skData!.length}');
          otherData = AllWells!
              .where((e) => e.AREA != "SK" && e.AREA != "WK" && e.AREA != "NK")
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
            ? screens[selectedPage]
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
              label: 'SK',
              icon: buildCustomBadget(
                counter: skData!.length,
                child:  ImageIcon(
                  AssetImage('assets/icons/South-Direction-icon.png'),
                  size: 32,
                ),
              ), //Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: otherData!.length.toString(),
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
