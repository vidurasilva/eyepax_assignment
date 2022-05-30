import 'package:eyepax_assignment/configs/colors.dart';
import 'package:eyepax_assignment/configs/text_style.dart';
import 'package:eyepax_assignment/models/artical_model.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:eyepax_assignment/utils/screensize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingalNews extends StatefulWidget {
  final Article? article;
  @override
  _SingalNewsState createState() => _SingalNewsState();
  const SingalNews({
    Key? key,
    this.article,
  }) : super(key: key);
}

class _SingalNewsState extends State<SingalNews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.favorite),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTopPart(),
            SizedBox(
              height: getScreenHeight(context, 20.0),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Text(
                  widget.article!.description!,
                  style: descriptionStyle(),
                ),
              ),
            ),
            SizedBox(
              height: getScreenHeight(context, 15.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopPart() => Stack(
        children: [
          Container(
            height: getScreenHeight(context, 220.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.article!.urlToImage!),
                  fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: getScreenWidth(context, 45.0),
                  height: getScreenHeight(context, 45.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25.0, top: 180.0),
            child: BlurryContainer(
                blur: 5,
                elevation: 0,
                color: Colors.transparent,
                padding: const EdgeInsets.all(8),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                height: getScreenHeight(context, 170.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        color: Colors.grey[200]),
                    child: buildBrandDetailsCard(widget.article!))),
          )
        ],
      );

  Widget buildBrandDetailsCard(Article article) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: getScreenHeight(context, 10.0),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    DateFormat('EEE, MMM d, ' 'yyyy')
                        .format(DateTime.parse(article.publishedAt!)),
                  ),
                ),
              ],
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  width: getScreenWidth(context, 250.0),
                  child: Text(
                    article.title!,
                    style: topCardTextstyle(),
                  ),
                ),
              ),
            ]),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Publish by " + article.author!,
                    // style: popularDarilsCardsecondTitleTextstyle(context),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getScreenHeight(context, 5.0),
            ),
          ],
          // ),
        ),
      );
}
