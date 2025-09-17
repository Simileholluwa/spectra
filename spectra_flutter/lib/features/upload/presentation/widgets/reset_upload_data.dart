import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_flutter/core/core.dart';

Future<bool?> resetUploadData(BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reset?',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop(false);
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              height: 0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Are you sure you want to reset? This action will clear any content that you may have added and can not be undone.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      flex: 1,
                      child: FilledButton(
                        onPressed: () {
                          context.pop(true);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.red,
                          ),
                        ),
                        child: Text('Reset'),
                      ).withLoading(
                        loading: false,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: FilledButton(
                        onPressed: () {
                          context.pop(false);
                        },
                        child: Text('Cancel'),
                      ).withLoading(
                        loading: false,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
