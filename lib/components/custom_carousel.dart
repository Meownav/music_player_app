import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final String title;
  final List<Map> albumList;

  const CustomCarousel({
    super.key,
    required this.title,
    required this.albumList,
  });

// will take [{albuminfo1}, {albuminfo2}...]
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.builder(
            padding: const EdgeInsets.all(4),
            scrollDirection: Axis.horizontal,
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // color: Colors.grey[300],
                  ),
                  width: 150,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                              albumList[index]["image"][2]["url"]),
                        ),
                      ),
                      Text(
                        albumList[index]["name"],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
