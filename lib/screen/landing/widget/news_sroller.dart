import 'package:eyepax_assignment/constant/router_path.dart';
import 'package:eyepax_assignment/models/artical_model.dart';
import 'package:flutter/material.dart';

class NewsScroller extends StatelessWidget {
  const NewsScroller({
    Key? key,
    this.articles,
  }) : super(key: key);

  final List<Article>? articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        itemCount: articles!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          articles![(articles!.length) - index - 1]
                              .urlToImage!),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                height: MediaQuery.of(context).size.height * 0.20,
                // width: MediaQuery.of(context).size.width * 0.85,
                child: Center(child: FittedBox(child: Text('KO $index'))),
              ),
              onTap: () {
                Navigator.pushNamed(context, ScreenConstant.toSingalNewsPage,
                    arguments: {
                      'article': articles![(articles!.length) - index - 1],
                    });
              },
            ),
          );
        });
  }
}
