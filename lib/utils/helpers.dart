import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin Helpers {
  void showSnackBar(BuildContext context,
      {bool error = false, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: error ? Colors.red : Colors.green,
      ),
    );
  }

  Future<bool> deleteDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) async {
    bool status = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(
                    SizeConfig.scaleHeight(10)),
                side: BorderSide(color: Colors.red.shade900, width: 1)),
            title: Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.scaleTextFont(15),
                color: Colors.red.shade900,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'
              ),
            ),
            content: Text(
              content,
              style: TextStyle(
                fontSize: SizeConfig.scaleTextFont(12),
                  fontFamily: 'Montserrat'

              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text(
                  AppLocalizations.of(context)!.no,
                  style: TextStyle(
                    fontSize: SizeConfig.scaleTextFont(12),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(AppLocalizations.of(context)!.yes,
                    style: TextStyle(
                      fontSize: SizeConfig.scaleTextFont(12),
                      color: Colors.red.shade900,
                      fontWeight: FontWeight.w600,
                    )),
              )
            ],
          );
        });
    return status;
  }
}
