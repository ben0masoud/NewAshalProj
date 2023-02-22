/*
import 'package:ashal_ver_3/main.dart';
import 'package:ashal_ver_3/services/wellTest.dart';
import 'package:flutter/material.dart';

import '../AllWellTestHistory_Page.dart';
import '../productionHistory_page.dart';
import '../production_history_detail_page.dart';
import '../welcome_page.dart';
import '../well_operation_status_history.dart';
import '../well_test_details.dart';
import '../widgets/well_complition_list_page.dart';
import '../wire_line_activity_history_page.dart';
import 'WellProduction.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    final List<dynamic> MyArgs = settings.arguments as List<dynamic>;


    switch (settings.name) {
      case '/':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => WellCompletionListPage(title: args),

          );
        }
        return _errorRoute();
      case '/welcome':
          return MaterialPageRoute(
            builder: (_) => WelcomePage(),
          );
      case '/WellTestDetails':
        if (args is WellTest) {
          return MaterialPageRoute(
            builder: (_) => WellTestDetails(ListWellTest: args,),

          );
        }
        return _errorRoute();
      case '/ProductionHistoryDetailPage':
        if (args is WellProduction) {
          return MaterialPageRoute(
            builder: (_) => ProductionHistoryDetailPage(item: args,),

          );
        }
        return _errorRoute();
      case '/ProductionHistoryPage':

          return MaterialPageRoute(
            builder: (_) => ProductionHistoryPage(item_uwi:  MyArgs[0].toString(), item_well_completion: MyArgs[1].toString()),

          );
      case '/WellOperationStatusHistory_Page':

        return MaterialPageRoute(
          builder: (_) => WellOperationStatusHistory_Page(item_uwi:  MyArgs[0].toString(), item_well_completion: MyArgs[1].toString(),item_well: MyArgs[2],),

        );
      case '/AllWellTestHistoryPage':

        return MaterialPageRoute(
          builder: (_) => AllWellTestHistoryPage(item_uwi:  MyArgs[0].toString(), item_well_completion: MyArgs[1].toString(),item_well: MyArgs[2],),

        );
      case '/WireLineActivityHistoryPage':

        return MaterialPageRoute(
          builder: (_) => WireLineActivityHistoryPage(item_uwi:  MyArgs[0].toString(), item_well_completion: MyArgs[1].toString(),item_well: MyArgs[2],),

        );
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();


    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

 */