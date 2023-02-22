import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  List<dynamic> counties = [];
  List<dynamic> stateMasters = [];
  List<dynamic> blockMasters = [];
  List<dynamic> states = [];
  List<dynamic> blocks = [];
  String? countryId;
  String? stateId;
  String? blockId;
  int? groupValue=0;

  @override
  void initState() {
    super.initState();

    this.counties.add({"id": 1, "name": "Kuwait"});
    this.counties.add({"id": 2, "name": "UAE"});

    stateMasters = [
      {"id": 1, "name": "Kuwait", "ParentId": 1},
      {"id": 2, "name": "Rakkah", "ParentId": 1},
      {"id": 3, "name": "Salmiya", "ParentId": 1},
      {"id": 4, "name": "Hawalli", "ParentId": 1},
      {"id": 5, "name": "Abu Dhabi", "ParentId": 2},
      {"id": 6, "name": "Dubai", "ParentId": 2},
      {"id": 7, "name": "Sharjah", "ParentId": 2}
    ];

    blockMasters = [
      {"id": 1, "name": "B1", "ParentId": 1},
      {"id": 2, "name": "B2", "ParentId": 1},
      {"id": 3, "name": "B3", "ParentId": 2},
      {"id": 4, "name": "B4", "ParentId": 3},
      {"id": 5, "name": "B6", "ParentId": 5},
      {"id": 6, "name": "B7", "ParentId": 5},
      {"id": 7, "name": "B5", "ParentId": 6}
    ];
  }

  @override
  DateTime dateTime = DateTime(DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Status',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    CupertinoSlidingSegmentedControl(
                      thumbColor: groupValue == 0 ? CupertinoColors.activeGreen : CupertinoColors.destructiveRed,
                      padding: EdgeInsets.all(4),
                      groupValue: groupValue,
                      children: {
                        0: buildSegment('Open'),
                        1: buildSegment('Close'),
                      },
                      onValueChanged: (groupValue) {
                        print(groupValue);
                        setState(() {
                          this.groupValue = groupValue as int?;

                        });
                      },


                    )
                  ],

                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Text('Date and Time',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ElevatedButton(
                        onPressed: pickDateTime,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            '${dateTime.year}/${dateTime.month}/${dateTime.day} ${dateTime.hour}:${dateTime.minute}',
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),

          ),
          FormHelper.dropDownWidget(
            context,
            "Select a chock",
            countryId,
            counties,
                (onChangedVal) {
              setState(() {
                countryId = onChangedVal;
                // print("selected Country: $onChangedVal");
                states = stateMasters
                    .where(
                      (stateItem) =>
                  stateItem["ParentId"].toString() ==
                      onChangedVal.toString(),
                )
                    .toList();
                stateId = null;
              });
              // print("selected State: ${states[0]}");
            },
                (onValidateVal) {
              if (onValidateVal == null) {
                return 'Please Select a chock';
              }
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            //optionValue: "id",
            // optionLabel: "lable"
          ),
          SizedBox(height: 10,),
          FormHelper.dropDownWidget(
            context,
            "Select a type",
            stateId,
            states,
                (onChangedVal) {
              setState(() {
                stateId = onChangedVal;
                blocks = blockMasters
                    .where(
                      (blockItem) =>
                  blockItem["ParentId"].toString() ==
                      onChangedVal.toString(),
                )
                    .toList();
                blockId = null;
              });

              //print("selected State: $onChangedVal");
            },
                (onValidate) {
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            //optionValue: "ID",
            //optionLabel: "Name"
          ),
          SizedBox(height: 10,),
          FormHelper.dropDownWidget(
            context,
            "Select a reason",
            blockId,

            blocks,
                (onChangedVal) {
              setState(() {
                blockId = onChangedVal;
              });
              //print("selected Block: $onChangedVal");
            },
                (onValidate) {
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            //optionValue: "ID",
            //optionLabel: "Name"
          ),
          SizedBox(height: 10,),
          FormHelper.dropDownWidget(
            context,
            "Select a reason",
            blockId,
            blocks,
                (onChangedVal) {
              setState(() {
                blockId = onChangedVal;
              });
              //print("selected Block: $onChangedVal");
            },
                (onValidate) {
              return null;
            },
            borderColor: Theme.of(context).primaryColor,
            borderFocusColor: Theme.of(context).primaryColor,
            borderRadius: 10,
            //optionValue: "ID",
            //optionLabel: "Name"
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Description',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Remarks',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
          ),


        ],
      ),
    );
  }
  Widget buildSegment(String text) => Container(
    padding: EdgeInsets.all(10),
    child: Text(
      text,
      style: TextStyle(fontSize: 12,color: Colors.white),
    ),
  );
  Future<DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context:context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
  );


  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute
    );
    setState(() => this.dateTime = dateTime);
  }
}