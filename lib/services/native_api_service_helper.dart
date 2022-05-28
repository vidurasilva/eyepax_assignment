import 'package:eyepax_assignment/constant/app_constants.dart';
import 'package:eyepax_assignment/notifire/eyepax_notifire.dart';
import 'package:eyepax_assignment/services/api_calling/fetch_news_data.dart';
import 'package:flutter/material.dart';
import 'package:eyepax_assignment/models/user_model.dart';
import 'package:provider/provider.dart';

nativeApiServiceHelper(BuildContext context, String apiCallType,
    {UserModel? accessRequestStudent}) async {
  switch (apiCallType) {
    case APICallName.ALL:
      {
        print("ALL");
      }
      break;

    case APICallName.NEWS:
      {
        await fetchNewsData().then((value) async {
          await Provider.of<EyePaxNotifier>(context, listen: false)
              .getNewsData(value);
        });
      }
      break;

    default:
  }
}


// return Consumer<PCCNotifier>(builder: (context, showPCC, _) {
    