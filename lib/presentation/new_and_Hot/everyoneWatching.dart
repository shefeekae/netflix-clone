import 'package:flutter/material.dart';

import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';

import 'package:netflix/presentation/widgets/video_actions.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryoneWatching extends StatelessWidget {
  EveryoneWatching(
      {super.key, required this.everyoneWatching, required this.index});

  List<Result> everyoneWatching = [];
  int index;

  @override
  Widget build(BuildContext context) {
    final everyOne = everyoneWatching;
    everyOne.shuffle();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          everyOne[index].originalTitle!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          everyOne[index].overview!,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(
          height: 50,
        ),
        VideoWidget(comingSoon: everyOne, index: index),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            VideoActions(
                icon: Icons.ios_share_rounded, title: 'Share', iconSize: 28),
            VideoActions(icon: Icons.add, title: 'Mylist', iconSize: 28),
            VideoActions(icon: Icons.play_arrow, title: 'Play', iconSize: 28)
          ],
        )
      ],
    );
  }
}
