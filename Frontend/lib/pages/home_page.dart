import 'package:flutter/material.dart';
import 'package:music_player_app/components/custom_carousel.dart';
import 'package:music_player_app/pages/album_page.dart';
import 'package:music_player_app/pages/player_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onAlbumTap(BuildContext context, String albumName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumPage(albumName: albumName),
      ),
    );
  }

  void _onSongTap(BuildContext context, String songTitle, String artistName,
      String albumArt) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlayerPage(
        songTitle: songTitle,
        artistName: artistName,
        albumArt: albumArt,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> topSongs = [
      'Song 1',
      'Song 2',
      'Song 3',
      'Song 4',
      'Song 5',
    ];

    final List<String> topAlbums = [
      'Album 1',
      'Album 2',
      'Album 3',
      'Album 4',
      'Album 5',
    ];

    final List<String> newSongs = [
      'New Song 1',
      'New Song 2',
      'New Song 3',
      'New Song 4',
      'New Song 5',
    ];

    final List<String> newAlbums = [
      'New Album 1',
      'New Album 2',
      'New Album 3',
      'New Album 4',
      'New Album 5',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("H O M E"),
        backgroundColor: Colors.white,
        elevation: 0,
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.all(16),
        //     child: Icon(Icons.search),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCarousel(
                title: 'Top Songs',
                items: topSongs,
                onItemTap: (item) => _onSongTap(
                    context, item, "Brambles", "lib/assets/images/cover.webp"),
              ),
              CustomCarousel(
                title: 'Top Albums',
                items: topAlbums,
                onItemTap: (albumName) => _onAlbumTap(context, albumName),
              ),
              CustomCarousel(
                title: 'New Songs',
                items: newSongs,
                onItemTap: (item) => _onSongTap(
                    context, item, "Brambles", "lib/assets/images/cover.webp"),
              ),
              CustomCarousel(
                title: 'New Albums',
                items: newAlbums,
                onItemTap: (albumName) => _onAlbumTap(context, albumName),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
