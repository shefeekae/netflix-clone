import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/const.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text('Top Searches',
              style: GoogleFonts.montserrat(
                  fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchTile(),
              separatorBuilder: (context, index) => kheight,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  const TopSearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: screenwidth / 2.3,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageurl,
                ),
              ),
            ),
          ),
        ),
        const Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(fontSize: 15),
          ),
        ),
        const Center(
          child: Icon(
            CupertinoIcons.play_circle_fill,
            color: Color.fromARGB(149, 255, 252, 252),
            size: 50,
          ),
        )
      ],
    );
  }
}
