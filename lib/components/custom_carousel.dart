import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final String title;
  final List<String> items;
  final void Function(String) onItemTap;

  const CustomCarousel({
    super.key,
    required this.title,
    required this.items,
    required this.onItemTap,
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
          // style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.all(4),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onItemTap(items[index]),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300], // Placeholder color
                  ),
                  width: 150,
                  child: Center(
                    child: Text(items[index]),
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
