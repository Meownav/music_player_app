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
  var topAlbumNames = [
    "Trilogy",
    "Dawn FM",
    "House of balloons",
    "Kiss land",
    "Guts"
  ];

  var newAlbumNames = [
    "Animal",
    "Death of slim shady",
    "Not like us",
  ];

  var topSongNames = [
    "Not like us",
    "birds of a feather",
    "Please please please",
    "Espresso",
    "who",
    "too sweet"
  ];

  var newSongNames = [
    "Fe!n",
    "I don't wanna wait",
    "Mirame",
    "I wanna be yours",
    "As it was",
  ];

  late Future<List<Map<dynamic, dynamic>>> topAlbums;
  late Future<List<Map<dynamic, dynamic>>> topSongs;
  late Future<List<Map<dynamic, dynamic>>> newAlbums;
  late Future<List<Map<dynamic, dynamic>>> newSongs;

  Future<List<Map<dynamic, dynamic>>> fetchData(
      List<String> names, String type, int limit) async {
    List<Map<dynamic, dynamic>> dataList = [];
    for (var name in names) {
      var url = Uri.parse(
          "https://saavn.dev/api/search/$type?query=$name&limit=$limit");
      var response = await http.get(url);
      var data = jsonDecode(response.body)["data"];
      var results = data["results"];
      dataList.add(results[0]);
    }
    return dataList;
  }

  @override
  void initState() {
    super.initState();
    topAlbums = fetchData(topAlbumNames, "albums", 1);
    newAlbums = fetchData(newAlbumNames, "albums", 1);
    topSongs = fetchData(topSongNames, "songs", 1);
    newSongs = fetchData(newSongNames, "songs", 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text("H O M E"),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<Map<dynamic, dynamic>>>(
                future: topAlbums,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    return CustomCarousel(
                      title: "Top Albums",
                      albumList: snapshot.data!,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<Map<dynamic, dynamic>>>(
                future: newAlbums,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    return CustomCarousel(
                      title: "New Albums",
                      albumList: snapshot.data!,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<Map<dynamic, dynamic>>>(
                future: topSongs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    return CustomCarousel(
                      title: "Top Songs",
                      albumList: snapshot.data!,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<Map<dynamic, dynamic>>>(
                future: newSongs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    return CustomCarousel(
                      title: "New Songs",
                      albumList: snapshot.data!,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
