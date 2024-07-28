import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final String title;
  final List<Map> albumList;

  const CustomCarousel({
    super.key,
    required this.title,
    required this.albumList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
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
                onTap: () {
                  // Handle album tap
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(-4, -4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              albumList[index]["image"][2]["url"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          albumList[index]["name"],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
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
