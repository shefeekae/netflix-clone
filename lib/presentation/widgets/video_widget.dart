import 'package:flutter/material.dart';
import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';
import 'package:netflix/core/api_constants.dart';

class VideoWidget extends StatelessWidget {
  VideoWidget({super.key, required this.comingSoon, required this.index});

  List<Result> comingSoon = [];
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(
                      imageBaseUrl + comingSoon[index].backdropPath!))),
        ),
        const Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.black12,
            child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.volume_off,
                  color: Colors.white,
                  size: 23,
                )),
          ),
        )
      ],
    );
  }
}
