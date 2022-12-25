
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../NavBar.dart';
import '../services/fetchDataApi.dart';
import '../services/gc_comp_connection.dart';
import '../services/well.dart';

class GcGonnectionHistoryPage extends StatefulWidget {
  final String? item_uwi;
  final String? item_well_completion;
  final Well? item_well;

  GcGonnectionHistoryPage({Key? key,this.item_uwi,this.item_well_completion,this.item_well}) : super(key: key);

  @override
  State<GcGonnectionHistoryPage> createState() => _GcGonnectionHistoryPageState();
}

class _GcGonnectionHistoryPageState extends State<GcGonnectionHistoryPage> {
  int index = 0;

  FetchDataApi fetchApi = FetchDataApi();


  @override
  Widget build(BuildContext context) {
    final screens = [
      GC_Comp('2233'),
      GC_Comp('dadsf'),
      GC_Comp('item_well_completion'),
    ];
    return Scaffold(
      appBar: AppBar(),
      drawer: NavBar(),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                )
            )
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.email_outlined),
                label: 'GC'
            ),
            NavigationDestination(
                icon: Icon(Icons.connect_without_contact_outlined),
                label: 'Slot'
            ),
            NavigationDestination(
                icon: Icon(Icons.account_balance_wallet_rounded),
                label: 'Header'
            ),
          ],
        ),
      ),
    );
  }

  Widget GC_Comp(String well_completion)
  {
    return FutureBuilder(
      future: fetchApi.fetchGcCompConnection(
          "::UWI='" + widget.item_uwi.toString() + "':START_TIME DESC"),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: Text('Loading...'),
            ),
          );
        }  else {
          List<GcCompConnection?> ListGcCompConnection =
          snapshot.data as List<GcCompConnection?>;
          return ListView.builder(
              itemCount: (ListGcCompConnection == null)
                  ? 0
                  : ListGcCompConnection.length,
              itemBuilder: (context, int index) {
                return buildCompanyCard(ListGcCompConnection, index);

              });
        }
      }
    );


  }
  Widget buildCompanyCard(List<GcCompConnection?> list, int i) {

    DateTime dt1,dt2;
    String _start_time,_end_time;
    if(list[i]!.START_TIME.toString().isNotEmpty) {
      dt1 =
          DateFormat('MM/dd/yyyy hh:mm').parse(list[i]!.START_TIME.toString());
      _start_time = DateFormat('dd/MM/yyyy h:mm a').format(dt1);
    }
    else
      _start_time ='';
    if(list[i]!.END_TIME.toString().isNotEmpty) {
       dt2 = DateFormat('MM/dd/yyyy hh:mm').parse(list[i]!.END_TIME.toString());
      _end_time = DateFormat('dd/MM/yyyy h:mm a').format(dt2);
    } else
      _end_time ='';

    return Padding(
      padding:  EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding:  EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                'GC',
                style:
                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                list[i]!.GC.toString(),
                style:
                TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Start Time',
                style:
                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _start_time,
                style:
                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'End Time',
                style:
                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _end_time,
                style:
                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
