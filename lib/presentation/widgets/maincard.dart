import 'package:flutter/material.dart';
import 'package:netflix/core/api_constants.dart';
import 'package:netflix/infrastructure/fetch_method.dart/fetch_method.dart';

import '../../Domain/Downloads/Model/downloads_model.dart';

class MainCardHome extends StatefulWidget {
  const MainCardHome({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  State<MainCardHome> createState() => _MainCardHomeState();
}

class _MainCardHomeState extends State<MainCardHome> {
  List<Result> mainCardImageList = [];

  @override
  void initState() {
    super.initState();
    fetchMainCardImage();
  }

  fetchMainCardImage() async {
    final movies = await fetchPost();

    setState(() {
      mainCardImageList = movies;
      mainCardImageList.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  imageBaseUrl + mainCardImageList[widget.index].posterPath!),
            ),
          ),
        ),
      ),
    );
  }
}
