

import 'package:ashal_ver_3/widgets/container_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant_values.dart';

class ShowChartPage extends StatefulWidget {
  final List<TestData> list;
  final String? title;
  final bool more;
   ShowChartPage({Key? key,required this.list,required this.more,this.title}) : super(key: key);

  @override
  State<ShowChartPage> createState() => _ShowChartPageState();
}

class _ShowChartPageState extends State<ShowChartPage> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      //DeviceOrientation.landscapeRight,
     // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title!,style: TextStyle(color: Colors.blue),)),
        backgroundColor: ConstantValues.MainColor1,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: ContainerChart(test: widget.list,more: widget.more,title: "",),
    );
  }
}
