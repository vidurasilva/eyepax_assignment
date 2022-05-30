import 'package:eyepax_assignment/configs/text_style.dart';
import 'package:eyepax_assignment/models/artical_model.dart';
import 'package:flutter/material.dart';

class LetestNewsScroller extends StatelessWidget {
  const LetestNewsScroller({
    Key? key,
    this.articles,
  }) : super(key: key);

  final List<Article>? articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: articles!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(articles![index].urlToImage!),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(
                  child: FittedBox(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.topLeft,
                        child: Text(
                          'By ' + articles![index].author!,
                          style: byAuther(),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          articles![index].title!,
                          style: titleStyle(),
                        )),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      alignment: Alignment.topLeft,
                      child: Text(
                        '"' + articles![index].description! + '"',
                        style: byAuther(),
                      )),
                ],
              ))),
            ),
          );
        });
  }
}
