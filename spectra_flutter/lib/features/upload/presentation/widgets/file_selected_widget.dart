import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class FileSelectedWidget extends ConsumerWidget {
  const FileSelectedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(uploadProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: state.mediaType == MediaType.video
            ? VideoFileSelectedWidget()
            : ImageFileSelectedWidget(),
      ),
    );
  }
}
