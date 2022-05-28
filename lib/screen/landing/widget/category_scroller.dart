import 'package:eyepax_assignment/configs/colors.dart';
import 'package:flutter/material.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      // itemExtent: 70.0,
      scrollDirection: Axis.horizontal,
      itemCount: 45,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[AppColors.primaryColor, AppColors.redColor],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(28.0),
              ),
            ),
            child: FittedBox(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text(
                      'Outlined Card',
                      style: TextStyle(color: Colors.white),
                    ),
                    // ),
                  )),
            ),
          ),
        );
      },
    ));
  }
}
