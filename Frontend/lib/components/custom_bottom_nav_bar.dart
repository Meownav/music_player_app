import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int curIdx;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.curIdx,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surface,
            spreadRadius: 4,
            blurRadius: 40,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BottomNavigationBar(
          currentIndex: curIdx,
          iconSize: 24,
          // type: BottomNavigationBarType.fixed,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FluentIcons.home_more_20_filled,
              ),
              activeIcon: Icon(
                FluentIcons.home_12_filled,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(FluentIcons.search_sparkle_32_regular),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_music_rounded),
              label: "Library",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.local_fire_department_rounded),
            //   label: "Hot",
            // )
          ],
        ),
      ),
    );
  }
}
