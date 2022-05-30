import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:eyepax_assignment/configs/text_style.dart';
import 'package:eyepax_assignment/constant/app_constants.dart';
import 'package:eyepax_assignment/models/artical_model.dart';
import 'package:eyepax_assignment/notifire/eyepax_notifire.dart';
import 'package:eyepax_assignment/screen/landing/widget/category_scroller.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:eyepax_assignment/screen/landing/widget/letest_news_scroller.dart';
import 'package:eyepax_assignment/screen/landing/widget/news_sroller.dart';
import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/services/native_api_service_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final LetestNewsScroller letestNewsScroller = LetestNewsScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<String> category = ["Healthy", "Technology", "Finance", "Art", "Sport"];

  @override
  void initState() {
    super.initState();
    // itemsData = getNewsPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<EyePaxNotifier>(builder: (context, showEyEPax, _) {
      List<Article> articles = showEyEPax.articles;
      String selectedCatogory = showEyEPax.selectedCatogory;
      return Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Latest News",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () async {
                      await nativeApiServiceHelper(context, APICallName.NEWS);
                    },
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'See All ',
                          style: seeAll(),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.secondoryColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: size.height * 0.40,
                child: InkWell(
                  child: LetestNewsScroller(articles: articles),
                  onTap: () {
                    print('Latest News');
                  },
                )),
            const SizedBox(
              height: 10,
            ),
            // Container(height: 10, child: CategoriesScroller()),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: size.height * 0.05,
                  child: CategoriesScroller(
                      category: category, selectedCatogory: selectedCatogory)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: NewsScroller(articles: articles),
            )
          ],
        ),
      );
    });
  }
}
