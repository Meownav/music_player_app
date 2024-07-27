import 'package:flutter/material.dart';

class AlbumInfo extends StatelessWidget {
  final String albumName;
  final String artistName;
  final String albumDetails;

  const AlbumInfo({
    super.key,
    required this.albumName,
    required this.artistName,
    required this.albumDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Album Icon
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "lib/assets/images/cover.webp",
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(width: 16),
        // Album Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                albumName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                artistName,
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              const SizedBox(height: 2),
              Text(
                albumDetails,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
