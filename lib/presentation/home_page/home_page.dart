import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/const.dart';
import 'package:netflix/presentation/fast_laugh/widgets/video_list_item.dart';
import 'package:netflix/presentation/home_page/number_card.dart';

import '../widgets/maintitle.dart';
import '../widgets/maintitlecard.dart';
import 'background_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        const BackgroundCard(),
                        const MainTitleCard(title: 'Released in the past year'),
                        const MainTitleCard(title: 'Trending Now'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MainTitle(
                              title: 'Top 10 TV shows in India Today',
                            ),
                            LimitedBox(
                              maxHeight: 240,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    10,
                                    (index) => NumberCard(
                                          index: index,
                                        )),
                              ),
                            )
                          ],
                        ),
                        const MainTitleCard(title: 'Tense Drama'),
                        const MainTitleCard(title: 'South Indian Cinema'),
                      ],
                    ),
                    scrollNotifier.value == true
                        ? Container(
                            color: Color.fromARGB(239, 0, 0, 0),
                            width: double.infinity,
                            height: 60,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://pngimg.com/uploads/netflix/small/netflix_PNG22.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    kwidth,
                                    Container(
                                      width: 25,
                                      height: 25,
                                      color: Colors.blueGrey,
                                    ),
                                    kwidth,
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
