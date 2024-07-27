import 'package:flutter/material.dart';
import 'package:music_player_app/components/custom_bottom_nav_bar.dart';
import 'package:music_player_app/pages/home_page.dart';
import 'package:music_player_app/pages/library_page.dart';
import 'package:music_player_app/pages/search_page.dart';

class PageProvider extends StatefulWidget {
  const PageProvider({super.key});

  @override
  State<PageProvider> createState() => _PageProviderState();
}

class _PageProviderState extends State<PageProvider> {
  int _curIdx = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pageList = [
    HomePage(),
    const SearchPage(),
    const LibraryPage(),
  ];

  void _onPageChanged(int idx) {
    setState(() => _curIdx = idx);
  }

  void _onTap(int idx) {
    setState(() => _curIdx = idx);
    _pageController.animateToPage(
      idx,
      duration: const Duration(milliseconds: 20),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        curIdx: _curIdx,
        onTap: _onTap,
      ),
    );
  }
}
