import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Domain/Downloads/Model/downloads_model.dart';
import 'package:netflix/core/colors/const.dart';
import 'package:netflix/infrastructure/fetch_method.dart/fetch_method.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

import 'coming_soon.dart';
import 'everyoneWatching.dart';

class NewAndHot extends StatefulWidget {
  const NewAndHot({super.key});

  @override
  State<NewAndHot> createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  List<Result> comingSoon = [];

  @override
  void initState() {
    super.initState();

    FetchcomingSoon();
  }

  FetchcomingSoon() async {
    final comingSoonFetched = await fetchPost();

    setState(() {
      comingSoon = comingSoonFetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  'New & Hot',
                  style: GoogleFonts.montserrat(
                      fontSize: 23, fontWeight: FontWeight.bold),
                ),
                // ignore: prefer_const_literals_to_create_immutables
                actions: [
                  const Icon(
                    Icons.cast,
                    color: Colors.white,
                    size: 30,
                  ),
                  kwidth,
                  Container(
                    height: 2,
                    width: 20,
                    color: Colors.blueGrey,
                  )
                ],
                // ignore: prefer_const_constructors
                bottom: TabBar(
                    isScrollable: true,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    tabs: const [
                      Tab(
                        text: '🍿 Coming Soon',
                      ),
                      Tab(
                        text: '''👀 Everyone's watching ''',
                      )
                    ]),
              ),
            ),
            body: TabBarView(children: [
              buildComingSoon(context),
              buildEveryoneWatching(),
            ]),
          )),
    );
  }

  buildComingSoon(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: comingSoon.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ComingSoonNewAndHot(
          index: index,
          newAndHot: comingSoon,
          size: size,
        );
      },
    );
  }

  buildEveryoneWatching() {
    return ListView.builder(
      itemCount: comingSoon.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return EveryoneWatching(
          everyoneWatching: comingSoon,
          index: index,
        );
      },
    );
  }
}
