import 'package:flutter/material.dart';

import 'maincard.dart';
import 'maintitle.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        LimitedBox(
          maxHeight: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                10,
                (index) => MainCardHome(
                      index: index,
                    )),
          ),
        )
      ],
    );
  }
}
