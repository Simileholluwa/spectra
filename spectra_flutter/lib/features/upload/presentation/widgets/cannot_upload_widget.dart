import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class CannotUploadWidget extends ConsumerWidget {
  const CannotUploadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(uploadProvider);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          enableInfiniteScroll: state.filePath.length > 1 ? true : false,
          height: 162,
          viewportFraction: state.filePath.length > 1 ? .8 : 1,
        ),
        items: state.filePath.asMap().entries.map((response) {
          final index = response.key;
          final res = state.searchVectorResponse[index];
          return Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
              horizontal: state.filePath.length > 1 ? 5 : 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                color: res.isDuplicate
                    ? Colors.red
                    : Theme.of(context).dividerColor,
                width: .5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                FileAndOptionsWidget(
                  index: index,
                ),
                const Divider(
                  height: 0,
                  thickness: .5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    Flexible(
                      child: Text(
                        res.isDuplicate
                            ? 'This file is ${(res.similarity * 100).toStringAsFixed(2)}% similar to an existing file. Please try another file.'
                            : 'This file is not similar to any existing file. Ready to be uploaded when you are!',
                        style: TextStyle(
                          color: res.isDuplicate ? Colors.red : TColors.primary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
