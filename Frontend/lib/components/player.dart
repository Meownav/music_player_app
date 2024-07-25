import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Progress bar
        Slider(
          value: 1.04,
          min: 0,
          max: 2.52,
          onChanged: (value) {},
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("1:04"),
            Text("2:52"),
          ],
        ),
        const SizedBox(height: 20),
        // Playback controls
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.shuffle),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.skip_previous),
              onPressed: () {},
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.play_arrow),
            ),
            IconButton(
              icon: const Icon(Icons.skip_next),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.repeat),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
