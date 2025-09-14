import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class FileAndOptionsWidget extends ConsumerWidget {
  const FileAndOptionsWidget({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 15,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: state.mediaType == MediaType.image
                ? Image.file(
                    File(
                      state.thumbnailsFilePaths.isEmpty
                          ? state.filePath[index]
                          : state.thumbnailsFilePaths[index],
                    ),
                    fit: BoxFit.cover,
                    height: 70,
                    width: 70,
                  )
                : state.thumbnailsFilePaths.isEmpty
                    ? Container(
                        height: 70,
                        width: 70,
                        color: Theme.of(context).cardColor,
                        child: Icon(
                          Iconsax.play_circle,
                        ),
                      )
                    : Image.file(
                        File(
                          state.thumbnailsFilePaths.first,
                        ),
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 5,
            children: [
              Text(
                '${index + 1}/${state.filePath.length}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: .5,
                  ),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        showMediaFullSize(context, index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                        child: Text(
                          'Full media size',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: const VerticalDivider(
                        width: 0,
                        thickness: .5,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        resetUploadData(
                          context,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (state.filePath.length > 1)
                      SizedBox(
                        height: 30,
                        child: const VerticalDivider(
                          width: 0,
                          thickness: .5,
                        ),
                      ),
                    if (state.filePath.length > 1)
                      InkWell(
                        onTap: () {
                          notifier.removeFilePath(
                            state.filePath[index],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                          child: Icon(
                            Iconsax.trash,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
