
import 'package:ashal_ver_3/services/slot_comp_connection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SLotCompConnectionPage extends StatelessWidget {
  final List<SlotCompConnection?> slot_comp_list;
  final String? gc_header_slot;

  SLotCompConnectionPage({Key? key,required this.slot_comp_list,this.gc_header_slot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('slot_comp_list in slot page = $slot_comp_list');
    return buildCompanyCard(slot_comp_list);

  }
  Widget buildCompanyCard(List<SlotCompConnection?> lists) {
    DateTime dt1 ,dt2;
    String _start_time,_end_time;
    if(lists.length>0) {
      return ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, int i) {
            final list = lists[i];

            if (list!
                .START_TIME
                .toString()
                .isNotEmpty) {
              dt1 =
                  DateFormat('MM/dd/yyyy hh:mm').parse(
                      list.START_TIME.toString());
              _start_time = DateFormat('dd/MM/yyyy h:mm a').format(dt1);
            } else
              _start_time = '';
            if (list
                .END_TIME
                .toString()
                .isNotEmpty) {
              dt2 =
                  DateFormat('MM/dd/yyyy hh:mm').parse(
                      list.END_TIME.toString());
              _end_time = DateFormat('dd/MM/yyyy h:mm a').format(dt2);
            }
            else {
              _end_time = '';
            }
            return Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        gc_header_slot!,
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        list.SLOT.toString(),
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

      );
    }
    else
    {
      return Center(child: Text('No data',style: TextStyle(fontSize: 15),),);
    }
  }
}

