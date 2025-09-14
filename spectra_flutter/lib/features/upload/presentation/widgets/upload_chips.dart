import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UploadChips extends StatelessWidget {
  const UploadChips({
    super.key,
    required this.icon,
    required this.title,
    required this.addText,
    required this.onAddTapped,
    required this.onDeleteTapped,
    required this.items,
  });

  final IconData icon;
  final String title;
  final String addText;
  final VoidCallback onAddTapped;
  final Function(String) onDeleteTapped;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        GestureDetector(
          onTap: onAddTapped,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: onAddTapped,
                child: Icon(
                  Iconsax.add_circle5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        if (items.isNotEmpty)
          SingleChildScrollView(
            padding: const EdgeInsets.only(right: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: items.map((item) {
                return Chip(
                  label: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  onDeleted: () => onDeleteTapped(item),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
