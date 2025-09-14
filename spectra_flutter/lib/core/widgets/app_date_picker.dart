import 'package:spectra_flutter/core/core.dart';
import 'package:flutter/material.dart';

Future<DateTime?> pickDate(
  BuildContext context,
  String helpText,
  DateTime initialDate,
  DateTime firstDate,
  DateTime lastDate,
) async {
  final pickedDate = await showDatePicker(
    context: context,
    switchToInputEntryModeIcon: const Icon(
      Icons.add,
      color: Colors.transparent,
    ),
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    helpText: helpText,
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          datePickerTheme: DatePickerThemeData(
            surfaceTintColor: Colors.transparent,
            elevation: 4,
            headerBackgroundColor: TColors.primary,
            headerForegroundColor: TColors.textWhite,
          ),
        ),
        child: child!,
      );
    },
  );
  if (pickedDate != null) {
    final dateTime = pickedDate;
    return dateTime;
  }
  return null;
}
