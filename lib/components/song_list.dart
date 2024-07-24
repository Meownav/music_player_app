import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  final List<Map<String, String>> songs;

  const SongList({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            leading: Text(
              (index + 1).toString().padLeft(2, '0'),
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            title: Text(
              song['title']!,
              // style: Theme.of(context).textTheme.bodyText1,
            ),
            subtitle: Text(
              song['artist']!,
              // style: Theme.of(context).textTheme.bodyText2,
            ),
            trailing: Text(
              song['duration']!,
              // style: Theme.of(context).textTheme.bodyText2,
            ),
          );
        },
      ),
    );
  }
}
