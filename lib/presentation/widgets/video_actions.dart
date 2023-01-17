import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VideoActions extends StatelessWidget {
  const VideoActions(
      {super.key, required this.icon, this.iconSize = 30, required this.title});

  final IconData icon;
  final String title;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: iconSize,
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
