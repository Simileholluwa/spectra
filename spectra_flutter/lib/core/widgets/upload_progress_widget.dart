import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';

class UploadProgressWidget extends ConsumerWidget {
  const UploadProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadProgressNotifier = ref.watch(uploadStagesProvider.notifier);
    final uploadProgressState = ref.watch(uploadStagesProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 15,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        uploadProgressState.message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: uploadProgressState.hasError
                              ? Colors.red
                              : Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      Text(
                        '${(uploadProgressState.progress * 100).toStringAsFixed(0)}%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                    value: uploadProgressState.progress,
                  ),
                ],
              ),
            ),
            if (uploadProgressState.hasError)
              InkWell(
                onTap: () {
                  uploadProgressNotifier.uploadArtwork();
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Icon(
                    Icons.refresh,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
