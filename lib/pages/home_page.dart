// ignore_for_file: unused_local_variable, prefer_const_constructors_in_immutables,prefer_const_constructors, avoid_print, unused_import

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:music_player_app/components/custom_carousel.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Map<dynamic, dynamic>>> topAlbums;
  late Future<List<Map<dynamic, dynamic>>> topSongs;
  late Future<List<Map<dynamic, dynamic>>> newAlbums;
  late Future<List<Map<dynamic, dynamic>>> newSongs;

  var topAlbumNames = [
    "Trilogy",
    "Dawn FM",
    "House of balloons",
    "Kiss land",
    "Guts"
  ];

  Future<List<Map<dynamic, dynamic>>> fetchAlbums(
      String album, int limit) async {
    var url = Uri.parse(
        "https://saavn.dev/api/search/albums?query=$album&limit=$limit");
    var response = await http.get(url);
    var data = jsonDecode(response.body)["data"];
    var results = data["results"];
    return List<Map<dynamic, dynamic>>.from(results);
  }

  Future<List<Map<dynamic, dynamic>>> fetchTopAlbums(
      List<String> topAlbumNames) async {
    List<Map<dynamic, dynamic>> albums = [];
    for (var album in topAlbumNames) {
      var albumData = await fetchAlbums(album, 1);
      albums.add(albumData[0]);
    }
    print(albums[0]["image"]);
    return albums;
  }

  @override
  void initState() {
    super.initState();
    topAlbums = fetchTopAlbums(topAlbumNames);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("H O M E"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              FutureBuilder<List<Map<dynamic, dynamic>>>(
                future: topAlbums,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error, ${snapshot.error}");
                  } else {
                    return CustomCarousel(
                      title: "New Songs",
                      albumList: snapshot.data!,
                    );
                  }
                },
              ),
              FutureBuilder<List<Map<dynamic, dynamic>>>(
                future: topAlbums,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error, ${snapshot.error}");
                  } else {
                    return CustomCarousel(
                      title: "New Albums",
                      albumList: snapshot.data!,
                    );
                  }
                },
              ),
              FutureBuilder<List<Map<dynamic, dynamic>>>(
                future: topAlbums,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error, ${snapshot.error}");
                  } else {
                    return CustomCarousel(
                      title: "Top Songs",
                      albumList: snapshot.data!,
                    );
                  }
                },
              ),
              FutureBuilder<List<Map<dynamic, dynamic>>>(
                future: topAlbums,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error, ${snapshot.error}");
                  } else {
                    return CustomCarousel(
                      title: "Top Albums",
                      albumList: snapshot.data!,
                    );
                  }
                },
              ),
              Text("hie"),
              Text("hie"),
            ],
          ),
        ),
      ),
    );
  }
}
