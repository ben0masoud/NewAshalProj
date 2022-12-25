
//import 'dart:convert';

import 'package:ashal_ver_3/services/fetchDataApi.dart';
import 'package:ashal_ver_3/services/gc_comp_connection.dart';
import 'package:ashal_ver_3/services/header_comp_connection.dart';
import 'package:ashal_ver_3/services/slot_comp_connection.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/slot_comp_connection.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:intl/intl.dart';
//import 'package:http/http.dart' as http;
//import 'NavBar.dart';
import 'gc_comp_connection.dart';
import 'header_comp_connection.dart';

class GcGonnectionHistoryPage extends StatefulWidget {
  final String? item_uwi;
  final String? item_well_completion;
  final Well? item_well;

  GcGonnectionHistoryPage({Key? key,this.item_uwi,this.item_well_completion,this.item_well}) : super(key: key);

  //String? _itemWell_completion = item_well_completion;
  @override
  State<GcGonnectionHistoryPage> createState() => _GcGonnectionHistoryPageState();
}

class _GcGonnectionHistoryPageState extends State<GcGonnectionHistoryPage> {
  late int selectedPage;

   FetchDataApi fetchApi = FetchDataApi();

   late List<GcCompConnection?> gc_comp_list ;
   late List<HeaderCompConnection?> header_comp_list ;
   late List<SlotCompConnection?> slote_comp_list ;
   var results;
   bool isLoad = false;





  //var GcGompList;
  late List screens;



  initState() {
    gc_comp_list =[];
    header_comp_list=[] ;
    slote_comp_list =[];
    screens=[];
    selectedPage=0;
    isLoad = false;
    super.initState();
    _fetchData();

  }

  Future _fetchData() async {
  //  results = await Future.wait([
      //fetchApi.fetchGcCompConnection("::WELL_COMPLETION_S= ${widget.item_well_completion}"),
      //fetchApi.fetchHeaderCompConnection("::WELL_COMPLETION_S= ${widget.item_well_completion}"),
      //fetchApi.fetchSlotCompConnection("::WELL_COMPLETION_S= ${widget.item_well_completion}"),

 //   ]);
    results = await fetchApi.fetchGcCompConnection("::WELL_COMPLETION_S= ${widget.item_well_completion}:START_TIME DESC");
    gc_comp_list = results!.cast<GcCompConnection?>().toList();
    results = await fetchApi.fetchHeaderCompConnection("::WELL_COMPLETION_S= ${widget.item_well_completion}:START_TIME DESC");
    header_comp_list = results!.cast<HeaderCompConnection?>().toList();
    results = await fetchApi.fetchSlotCompConnection("::WELL_COMPLETION_S= ${widget.item_well_completion}:START_TIME DESC");
    slote_comp_list = results!.cast<SlotCompConnection?>().toList();

    setState(() {

    //  gc_comp_list = results[0]!.cast<GcCompConnection?>().toList();
    //  header_comp_list = results[1]!.cast<HeaderCompConnection?>().toList();
    //  slote_comp_list = results[2]!.cast<SlotCompConnection?>().toList();
     // print(gc_comp_list);
     // print(header_comp_list);
     // print(slote_comp_list);


      screens = [
        GcCompConnectionPage(
          gc_comp_list: gc_comp_list, gc_header_slot: 'GC',),
        HeaderCompConnectionPage(
          header_comp_list: header_comp_list, gc_header_slot: 'Header',),
        SLotCompConnectionPage(
          slot_comp_list: slote_comp_list, gc_header_slot: 'Slote',),
      ];
      isLoad = true;
    });

  }

  @override


  Widget build(BuildContext context) {


       // print('build gc_comp_list $gc_comp_list and ${gc_comp_list.isEmpty}');
       // print('build header_comp_list $header_comp_list and ${header_comp_list.isEmpty}');
       // print('build slote_comp_list $slote_comp_list and ${slote_comp_list.isEmpty}' );
        //if ((gc_comp_list == null) && (header_comp_list== null) && (slote_comp_list== null))
      if(!isLoad)
            return IsEmptyPage();
          else
            return NotEmptyPage();



  }

  Scaffold NotEmptyPage() {

    return Scaffold(

      appBar: AppBar(),
     // endDrawer: NavBar(),
      body: screens[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined), label: 'GC'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: 'Header'),
            BottomNavigationBarItem(
                icon: Icon(Icons.connect_without_contact_outlined),
                label: 'Slot'),

          ],
          selectedItemColor: Colors.green,
          elevation: 5.0,
          unselectedItemColor: Colors.green[900],
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              //print('index = $index');
              selectedPage = index;
            });
          }
      ),
    );
  }
  Scaffold IsEmptyPage() {
    return Scaffold(
      appBar: AppBar(),
    //  endDrawer: NavBar(),
      body: Center(child: CircularProgressIndicator()),
    );
  }
/*
  Future<List<GcCompConnection>> fetchGcCompConnection(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/Wellbore.json'));
    http.Response response = await http.get(Uri.parse('https://ashal.kockw.com/test/api/v1.0/GetTable/Gc_Comp_Connection$JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<GcCompConnection> Gc_comp_connection = [];
      Gc_comp_connection.clear();
      for(var item in body) {
        Gc_comp_connection.add(GcCompConnection.fromJson(item));
      }
      print("value from fetchGcCompConnection = $Gc_comp_connection");
      return Gc_comp_connection;
    }
    return [];
  }

  Future<List<HeaderCompConnection>> fetchHeaderCompConnection(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/Wellbore.json'));
    http.Response response = await http.get(Uri.parse('https://ashal.kockw.com/test/api/v1.0/GetTable/Header_Comp_Connection$JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<HeaderCompConnection> Header_comp_connection = [];
      Header_comp_connection.clear();
      for(var item in body) {
        Header_comp_connection.add(HeaderCompConnection.fromJson(item));
      }
      return Header_comp_connection;
    }
    return [];
  }

  Future<List<SlotCompConnection>> fetchSlotCompConnection(String JsonFilter) async {
    //http.Response response = await http.get(Uri.parse('https://wsms.kockw.com/imms/Wellbore.json'));
    http.Response response = await http.get(Uri.parse('https://ashal.kockw.com/test/api/v1.0/GetTable/Slot_Comp_Connection $JsonFilter'));
    if(response.statusCode ==200){
      var body = jsonDecode(response.body);
      List<SlotCompConnection> Slot_comp_connection = [];
      Slot_comp_connection.clear();
      for(var item in body) {
        Slot_comp_connection.add(SlotCompConnection.fromJson(item));
      }
      return Slot_comp_connection;
    }
    return [];
  }

*/

}