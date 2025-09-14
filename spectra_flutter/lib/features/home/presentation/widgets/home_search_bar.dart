import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SearchAnchor.bar(
        barHintText: 'Search artworks, artists, and more...',
        barLeading: Icon(
          Iconsax.search_normal,
          color: Colors.grey.shade600,
        ),
        suggestionsBuilder: (context, controller) {
          final query = controller.text;
          final filtered = []
              .where((s) =>
                  s.toLowerCase().contains(query.toLowerCase()) &&
                  query.isNotEmpty)
              .toList();

          if (filtered.isEmpty) {
            return [const SizedBox.shrink()];
          }

          return filtered.map((s) {
            return ListTile(
              title: Text(s),
              leading: const Icon(Iconsax.search_normal, size: 18),
              onTap: () {
                controller.text = s;
                Navigator.of(context).pop();
              },
            );
          }).toList();
        },
        barBackgroundColor: WidgetStateProperty.all(
          Colors.white.withValues(
            alpha: 0.85,
          ),
        ),
        barShape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        barHintStyle: WidgetStateProperty.all(
          TextStyle().copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        barElevation: WidgetStateProperty.all(
          8,
        ),
      ),
    );
  }
}
