import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';
import 'package:netflix/core/api_constants.dart';
import 'package:netflix/core/colors/const.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';

import '../../../infrastructure/fetch_method.dart/fetch_method.dart';

class SearchResult extends StatefulWidget {
  SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  static List<Result> searchImageList = [];

  String imageurl =
      'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg';

  @override
  void initState() {
    super.initState();
    fetchSearchImage();
  }

  void fetchSearchImage() async {
    final movies = await fetchPost();
    setState(() {
      searchImageList = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text('Movies & TV',
              style: GoogleFonts.montserrat(
                  fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        kheight,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.5,
            shrinkWrap: true,
            children: List.generate(searchImageList.length, (index) {
              return MainCard(
                searchResult: searchImageList,
                index: index,
              );
            }),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  MainCard({super.key, required this.searchResult, required this.index});

  List<Result> searchResult;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageBaseUrl + searchResult[index].posterPath!),
        ),
      ),
    );
  }
}
