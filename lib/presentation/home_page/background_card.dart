import 'package:flutter/material.dart';
import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';
import 'package:netflix/core/api_constants.dart';

import '../../infrastructure/fetch_method.dart/fetch_method.dart';
import '../fast_laugh/widgets/video_list_item.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  List<Result> homeList = [];

  @override
  void initState() {
    super.initState();
    fetchBackgroundImage();
  }

  void fetchBackgroundImage() async {
    final movies = await fetchPost();
    setState(() {
      homeList = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/en/4/46/Video_Game_Cover_-_The_Last_of_Us.jpg"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const VideoActions(icon: Icons.add, title: 'My List'),
              TextButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 255))),
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 24,
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Play',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const VideoActions(icon: Icons.info_outline, title: 'Info'),
            ],
          ),
        )
      ],
    );
  }
}
