import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix/presentation/home_page/home_page.dart';
import 'package:netflix/presentation/mainpage/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_and_Hot/new_and_hot.dart';
import 'package:netflix/presentation/search/search.dart';

class Mainpage extends StatelessWidget {
  Mainpage({super.key});

  final pages = [
    const HomePage(),
    const NewAndHot(),
    const SearchPage(),
    DownloadPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: changeIndexNotifier,
        builder: (context, value, child) {
          return pages[value];
        },
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
