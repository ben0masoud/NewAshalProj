

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {

 static ShowErrorDialog({String? title = 'Error',String? description = 'Something went wrong'}) {

   Get.dialog(
     Dialog(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             Text(title ?? '',style: Get.textTheme.headline4,),
             Text(description ?? '',style: Get.textTheme.headline4,),
             ElevatedButton(
                 onPressed: (){
                   if(Get.isDialogOpen ?? false) Get.back();
                 },
                 child: Text('Okay')
             )
           ],
         ),
       ),
     )
   );

 }



}