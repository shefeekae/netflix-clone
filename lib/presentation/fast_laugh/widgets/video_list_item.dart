import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black12,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.volume_off,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(imageurl),
                  ),
                  VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                  VideoActions(icon: Icons.add, title: 'My List'),
                  VideoActions(icon: Icons.share, title: 'Share'),
                  VideoActions(icon: Icons.play_arrow, title: 'Play'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
