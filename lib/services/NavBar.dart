//import 'package:ashal_ver_3/WellTest_Container.dart';
import 'package:ashal_ver_3/services/constant_values.dart';
import 'package:ashal_ver_3/pages/production/productionHistory_page.dart';
//import 'package:ashal_ver_3/services/access_info.dart';
import 'package:ashal_ver_3/services/well.dart';
import 'package:ashal_ver_3/pages/well_status/well_operation_status_history.dart';
import 'package:ashal_ver_3/pages/well_summary/well_page.dart';
import 'package:ashal_ver_3/pages/well_connection/gc_connection_history_page.dart';
import 'package:ashal_ver_3/pages/well_test/well_test_and_chart_page.dart';
import 'package:ashal_ver_3/pages/well_test/well_test_chart.dart';
import 'package:ashal_ver_3/pages/wire_line_activity/wire_line_activity_history_page.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:share_plus/share_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../pages/wire_line_activity/AllWellTestHistory_Page.dart';
//import 'gc_list_page.dart';
import '../main.dart';
class NavBar extends StatelessWidget {
  final String? uwi;
  final String? well_completion;
  final Well? my_well;
  final List<String>? userPrivilege;
  final String? user;
  final List<Well>? wells;

   NavBar({Key? key, this.uwi,this.well_completion,this.my_well,this.userPrivilege,this.user,this.wells}) : super(key: key);
 final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: ConstantValues.MainColor1,//Color(0xFFBDEDB3),//Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: [
            /*
            UserAccountsDrawerHeader(
                accountName: Text('Almarri.com'),
                accountEmail: Text('ben0masoud@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(image: AssetImage('assets/albert-dera-ILip77SbmOE-unsplash.jpg'),
                    width: 90,
                      height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image:AssetImage('assets/profile-bg3.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            ),

             */
            const SizedBox(height: 40,),
            buildMenuItem(text: 'Main', icon: Icons.home, onClicked: ()=> selectedItem(context,0)),
            const SizedBox(height: 16,),
            buildMenuItem(text: 'Operation Status', icon: Icons.wysiwyg_outlined, onClicked: ()=> selectedItem(context,1)),
            const SizedBox(height: 16,),
            buildMenuItem(text: 'Well Test', icon: Icons.biotech, onClicked: ()=> selectedItem(context,2)),
            const SizedBox(height: 16,),
            buildMenuItem(text: 'Wireline Activity', icon: Icons.local_activity_rounded, onClicked: ()=> selectedItem(context,3)),
            const SizedBox(height: 16,),
            buildMenuItem(text: 'Production History', icon: Icons.oil_barrel, onClicked: ()=> selectedItem(context,4)),
            const SizedBox(height: 16,),
            buildMenuItem(text: 'GC Connection', icon: Icons.connect_without_contact, onClicked: ()=> selectedItem(context,5)),
            const SizedBox(height: 16,),
           // buildMenuItem(text: 'GC List', icon: Icons.connect_without_contact, onClicked: ()=> selectedItem(context,6)),
          //  const SizedBox(height: 16,),
         //   buildMenuItem(text: 'Well Test Chart', icon: Icons.bar_chart_outlined, onClicked: ()=> selectedItem(context,6)),
        //    const SizedBox(height: 16,),
            buildMenuItem(text: 'feedback by email', icon: Icons.feedback, onClicked: ()=> selectedItem(context,7)),
            //buildMenuItem(text: 'Exit', icon: Icons.exit_to_app, onClicked: ()=> SystemNavigator.pop()),
            const SizedBox(height: 16,),
            buildMenuItem(text: 'feedback by shared', icon: Icons.dynamic_feed, onClicked: ()=> selectedItem(context,8)),


          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
      required String text,
      required IconData icon,
      VoidCallback? onClicked,
      }) {
          final color = Colors.black;
          final hoverColor = Colors.white70;
          return ListTile(
            leading: Icon(icon,color: color),
            title: Text(text,style: TextStyle(color: color)),
            hoverColor: hoverColor,
            onTap: onClicked,
          );
        }
  void selectedItem(BuildContext context,int index){

    Navigator.of(context).pop();
    switch(index) {
      case 0:
        print('My Well  in NavBar.dart => $my_well.UWI');
        Navigator.of(context).push(
            MaterialPageRoute(
          builder: (context) =>
              WellPage(item: my_well,userPrivilege: userPrivilege,user: user,wells: wells),
                settings: RouteSettings(name: "Well_Page")
        ));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(
                           builder: (context) =>
                               WellOperationStatusHistory_Page(item_uwi: uwi,item_well_completion: well_completion,item_well: my_well,userPrivilege: userPrivilege,user: user,wells: wells),
                           settings: RouteSettings(name: "WellOperationStatusHistory_Page"))
        );
        break;
      case 2:
           /*Navigator.of(context).push(MaterialPageRoute(
               builder: (context) => AllWellTestHistoryPage(item_uwi: uwi,item_well_completion: well_completion,item_well: my_well,userPrivilege: userPrivilege,user: user),
               settings: RouteSettings(name: "AllWellTestHistoryPage")
           ));*/
           Navigator.of(context).push(MaterialPageRoute(
               builder: (context) => WellTestAndChartPage(item_uwi: uwi,item_well_completion: well_completion,item_well: my_well,userPrivilege: userPrivilege,user: user,wells: wells),
               settings: RouteSettings(name: "AllWellTestHistoryPage")
           ));
           break;

      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WireLineActivityHistoryPage(item_uwi: uwi,item_well_completion: well_completion,item_well: my_well,userPrivilege: userPrivilege,user: user,wells: wells),
            settings: RouteSettings(name: "WireLineActivityHistoryPage")
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductionHistoryPage(item_uwi: uwi,item_well_completion: well_completion,item_well: my_well,userPrivilege: userPrivilege,user: user,wells: wells),
            settings: RouteSettings(name: "ProductionHistoryPage")
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GcGonnectionHistoryPage(item_uwi: uwi,item_well_completion: well_completion,item_well: my_well,userPrivilege: userPrivilege,user: user,wells: wells),
            settings: RouteSettings(name: "GcGonnectionHistoryPage")
        ));
        break;
      case 6:
       /* Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WellTestChart(item_uwi: uwi,item_well_completion: well_completion,item_well: my_well,userPrivilege: userPrivilege,user: user),
            settings: RouteSettings(name: "Well Test Chart")
        ));*/
        break;
      case 7:
            FeedbackByEmail(context);
        break;
      case 8:
        FeedbackByShared(context);
        break;


           //SystemNavigator.pop()
    }
  }
  void FeedbackByEmail(BuildContext context) async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    BetterFeedback.of(context).show((feedback) async {
      // draft an email and send to developer
      final screenshotFilePath =
      await writeImageToStorage(feedback.screenshot);

      final Email email = Email(
        body: feedback.text,
        subject: 'App : ${appName}, version: ${version}, buildNumber: ${buildNumber} Feedback',
        recipients: ['AshalSupport@kockw.com'],
        attachmentPaths: [screenshotFilePath],
        isHTML: false,
      );
      await FlutterEmailSender.send(email);
    });
  }
  void FeedbackByShared(BuildContext context){
    BetterFeedback.of(context).show(
          (feedback) async {
        final screenshotFilePath =
        await writeImageToStorage(feedback.screenshot);

        /*await Share.shareFiles(
                        [screenshotFilePath],
                        text: feedback.text,
                      );*/
        await Share.shareXFiles( [XFile(screenshotFilePath)],
          text: feedback.text,);
      },
    );
  }
}
