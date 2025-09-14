import 'package:flutter/material.dart';
import 'package:spectra_flutter/core/core.dart';

class ItemChip extends StatelessWidget {
  const ItemChip({
    super.key,
    required this.itemName,
    required this.usageCount,
    required this.onTap,
    this.isSelected = false,
  });

  final String itemName;
  final String usageCount;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? TColors.primary : Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 4),
                child: Text(
                  itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected
                        ? TColors.white
                        : Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 2),
              child: Text(
                usageCount,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? TColors.white
                      : Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
