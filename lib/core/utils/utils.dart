import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  Utils._();
  static final instanse=Utils._(); 
  Future<void> showCustomDialog({required BuildContext context,required VoidCallback onPressed,required String title,required String subTitle}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        insetAnimationCurve:Curves.easeInOutBack,
        title:  Text(title,style: Theme.of(context).textTheme.labelMedium),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(subTitle,style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ),
        actions: [
           TextButton(
            child:  Text('لا',style: Theme.of(context).textTheme.titleLarge),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            onPressed: (){
              onPressed();
              Navigator.of(context).pop();
            },
            child:  Text('التأكيد',style: Theme.of(context).textTheme.titleLarge),
          ),
        ],
      );
    },
  );
}
}