import 'package:spectra_flutter/core/core.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppDropdownButton extends ConsumerWidget {
  const AppDropdownButton({
    super.key,
    required this.dropdownItems,
    required this.value,
    required this.onChanged,
    required this.subtitle,
    this.width = double.maxFinite,
    this.rightPadding = 16,
    this.leftPadding = 8,
  });

  final List<String> dropdownItems;
  final dynamic value;
  final void Function(dynamic)? onChanged;
  final double width;
  final double rightPadding;
  final double leftPadding;
  final String subtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          subtitle,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            style: Theme.of(context).textTheme.bodyMedium,
            items:
                THelperFunctions.addDividersAfterItems(dropdownItems, context),
            value: value,
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.only(
                right: rightPadding,
                left: leftPadding,
              ),
              height: 58,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.sm),
                border: Border.all(
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.darkGrey
                      : TColors.darkerGrey,
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              offset: const Offset(
                0,
                -10,
              ),
              maxHeight: 400,
              elevation: 0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              customHeights: THelperFunctions.getCustomItemsHeights(
                dropdownItems,
              ),
            ),
            iconStyleData: const IconStyleData(
              openMenuIcon: Icon(
                Icons.arrow_drop_up,
                color: TColors.primary,
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: TColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
