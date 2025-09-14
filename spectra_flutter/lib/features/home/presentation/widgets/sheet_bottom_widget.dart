import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/core/core.dart';

class SheetBottomWidget extends StatelessWidget {
  const SheetBottomWidget({
    super.key,
    required this.searchInput,
    required this.onChanged,
    required this.showSelected,
    required this.items,
    required this.onDelete,
    required this.hintText,
    required this.subtitle,
  });

  final TextEditingController searchInput;
  final void Function(String?) onChanged;
  final bool showSelected;
  final List<String> items;
  final Function(String) onDelete;
  final String hintText;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(subtitle),
          AppTextField(
            textController: searchInput,
            prefixIcon: Iconsax.tag5,
            textCapitalization: TextCapitalization.none,
            hintText: hintText,
            maxLines: 1,
            validator: (value) {
              return null;
            },
            onChanged: (value) => onChanged(value),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (showSelected)
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                right: 5,
              ),
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
                    onDeleted: () => onDelete(item),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
