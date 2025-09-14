import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/home/home.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

Future<dynamic> showMediaFullSize(
  BuildContext context,
  int index,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(uploadProvider);
          return state.mediaType == MediaType.image
              ? Image.file(
                  File(
                    state.filePath[index],
                  ),
                )
              : VideoPlayerWidget(
                  videoUrl: state.filePath.first,
                  useBorderRadius: false,
                );
        },
      );
    },
  );
}
