import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';
import 'package:netflix/core/api_constants.dart';
import 'package:netflix/core/colors/const.dart';
import 'package:netflix/infrastructure/fetch_method.dart/fetch_method.dart';
import '../../widgets/app_bar_widget.dart';

class DownloadPage extends StatefulWidget {
  DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  List<Result> downloadImageList = [];
  @override
  void initState() {
    super.initState();

    fetchDownloadImage();
  }

  void fetchDownloadImage() async {
    final movies = await fetchPost();
    setState(() {
      downloadImageList = movies;
    });
  }

  // final imageList = [
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView(
          children: [
            kheight,

            //section 1
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 27,
                  ),
                  kwidth,
                  const Text(
                    'Smart Downloads',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            //section 1 ends

            kheight,

            //section 2
            const Text(
              'Introducing Downloads for you',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            kheight,
            const Text(
              '''We'll download a personalized selection of \nmovies and shows for you,so there is \nalways something to watch on your\n device.''',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            kheight,
            Container(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 52, 52, 52),
                      radius: size.width * 0.35,
                    ),
                  ),
                  DownloadimageWidget(
                    angle: -20,
                    imageList: imageBaseUrl + downloadImageList[8].posterPath!,
                    margin: const EdgeInsets.only(right: 160),
                  ),
                  DownloadimageWidget(
                    angle: 20,
                    imageList: imageBaseUrl + downloadImageList[2].posterPath!,
                    margin: const EdgeInsets.only(left: 160),
                  ),
                  DownloadimageWidget(
                    angle: 0,
                    imageList: imageBaseUrl + downloadImageList[6].posterPath!,
                    margin: const EdgeInsets.only(top: 30),
                  )
                ],
              ),
            ),
            //section 2 ends

            const SizedBox(
              height: 55,
            ),

            //section 3
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 59, 53, 180),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Set Up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'See What You Can Download',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            //section 3 ends
          ],
        ),
      ),
    );
  }
}

class DownloadimageWidget extends StatelessWidget {
  const DownloadimageWidget({
    Key? key,
    required this.angle,
    required this.imageList,
    required this.margin,
  }) : super(key: key);

  final double angle;
  final EdgeInsets margin;
  final String imageList;

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: screenwidth / 2.8,
        height: screenheight / 3.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageList)),
        ),
      ),
    );
  }
}
