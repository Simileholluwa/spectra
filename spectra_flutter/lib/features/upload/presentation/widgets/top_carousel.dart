import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class TopCarousel extends ConsumerWidget {
  const TopCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    final state = ref.watch(uploadProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: CarouselSlider(
        carouselController: state.carouselController,
        options: CarouselOptions(
          height: 80,
          scrollPhysics: const NeverScrollableScrollPhysics(),
        ),
        items: [0, 1, 2, 3].map((i) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            padding: const EdgeInsets.only(
              right: 5,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: TColors.primary,
                width: .5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 55,
                  height: 62,
                  padding: EdgeInsets.only(top: width > 600 ? 0 : 7),
                  alignment:
                      width > 600 ? Alignment.center : Alignment.topCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Icon(
                    icons[i],
                    color: TColors.primary,
                    size: 35,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: width > 600
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: [
                        Text(
                          'Step ${i + 1}: ${texts[i]}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          subTitle[i],
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
