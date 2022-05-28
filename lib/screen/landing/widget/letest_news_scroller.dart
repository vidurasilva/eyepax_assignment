import 'package:flutter/material.dart';

class LetestNewsScroller extends StatelessWidget {
  const LetestNewsScroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.cnn.com/cnnnext/dam/assets/220526005247-01-china-state-council-economic-meeting-file-super-tease.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              width: MediaQuery.of(context).size.width * 0.85,
              child: Center(child: FittedBox(child: Text('KO $index'))),
            ),
          );
        });
  }
}
