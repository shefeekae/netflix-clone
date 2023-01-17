import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          10,
          (index) => VideoListItem(
            index: index,
          ),
        ),
      ),
    ));
  }
}
