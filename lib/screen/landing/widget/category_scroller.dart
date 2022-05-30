import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/configs/text_style.dart';
import 'package:eyepax_assignment/notifire/eyepax_notifire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key, this.category, this.selectedCatogory})
      : super(key: key);
  final List<String>? category;
  final String? selectedCatogory;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: category!.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: selectedCatogory == category![index]
                    ? <Color>[AppColors.primaryColor, AppColors.redColor]
                    : <Color>[AppColors.whiteColor, AppColors.whiteColor],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(28.0),
              ),
            ),
            child: InkWell(
              child: FittedBox(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(category![index],
                          textAlign: TextAlign.center,
                          style: selectedCatogory == category![index]
                              ? selectedCategoryText()
                              : unSelectedCategoryText()),
                      // ),
                    )),
              ),
              onTap: () async {
                await Provider.of<EyePaxNotifier>(context, listen: false)
                    .setSelectedCotegoryName(category![index]);
              },
            ),
          ),
        );
      },
    ));
  }
}
