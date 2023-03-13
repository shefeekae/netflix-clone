import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';

import '../widgets/video_actions.dart';
import '../widgets/video_widget.dart';

class ComingSoonNewAndHot extends StatelessWidget {
  ComingSoonNewAndHot(
      {super.key,
      required this.index,
      required this.newAndHot,
      required this.size});

  List<Result> newAndHot = [];
  final Size size;
  int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            children: [
              const Text(
                'FEB',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                '${index + 10}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                index: index,
                comingSoon: newAndHot,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      newAndHot[index].originalTitle ?? 'Loading...',
                      style:
                          GoogleFonts.aBeeZee(fontSize: 30, letterSpacing: 0),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: const [
                      VideoActions(
                        icon: Icons.notifications,
                        title: 'remind me',
                        iconSize: 25,
                      ),
                      VideoActions(
                        icon: Icons.info_outline,
                        title: 'info',
                        iconSize: 25,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  )
                ],
              ),
              const Text(
                'Coming on Friday',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                newAndHot[index].originalTitle ?? "Loading...",
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Flexible(
                child: Text(
                  newAndHot[index].overview ?? "Loading...",
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
