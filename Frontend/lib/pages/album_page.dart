import 'package:flutter/material.dart';
import 'package:music_player_app/components/album_info.dart';
import 'package:music_player_app/pages/player_page.dart';

class AlbumPage extends StatelessWidget {
  final String albumName;

  const AlbumPage({super.key, required this.albumName});

  void _onSongTap(BuildContext context, String songTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayerPage(
          songTitle: songTitle,
          artistName: "Brambles",
          albumArt: "lib/assets/images/cover.webp",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> songs = [
      {
        'title': 'To Speak Of Solitude',
        'artist': 'Brambles',
        'duration': '4:21'
      },
      {'title': 'Unsayable', 'artist': 'Brambles', 'duration': '2:52'},
      {
        'title': 'In The Androgynous Dark',
        'artist': 'Brambles',
        'duration': '4:43'
      },
      {'title': 'Salt Photographs', 'artist': 'Brambles', 'duration': '6:54'},
      {
        'title': 'Pink And Golden Billows',
        'artist': 'Brambles',
        'duration': '2:58'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios_new),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      // bottomNavigationBar: const CustomBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            // Album Info and picture
            AlbumInfo(
              albumName: albumName,
              artistName: "Brambles",
              albumDetails: "Album • 8 songs • 2012",
            ),
            const SizedBox(height: 20),
            // Play and Shuffle buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Center(
                      child: Text(
                        "Play",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromRGBO(244, 243, 246, 1),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Center(
                      child: Text(
                        "Shuffle",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Song list
            Expanded(
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
                    onTap: () => _onSongTap(context, song['title']!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
