import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';
import 'package:netflix/core/api_constants.dart';

import '../../infrastructure/fetch_method.dart/fetch_method.dart';

class NumberCard extends StatefulWidget {
  final int index;
  const NumberCard({super.key, required this.index});

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  List<Result> numberCardList = [];

  @override
  void initState() {
    super.initState();

    fetchNumberCardList();
  }

  fetchNumberCardList() async {
    final movies = await fetchPost();

    setState(() {
      numberCardList = movies;
      numberCardList.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
                height: 150,
              ),
              Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageBaseUrl +
                        numberCardList[widget.index].posterPath!),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 13,
            bottom: -20,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: BorderedText(
                strokeWidth: 4,
                strokeColor: Colors.white,
                child: Text(
                  "${widget.index + 1}",
                  style: GoogleFonts.montserrat(
                      fontSize: 100,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
