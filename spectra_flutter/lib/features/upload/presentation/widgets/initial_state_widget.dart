import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class InitialStateWidget extends ConsumerWidget {
  const InitialStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(uploadProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: .5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        notifier.pickImage();
                      },
                      icon: Icon(
                        Iconsax.gallery_add5,
                        color: Theme.of(context).primaryColor,
                        size: 35,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        notifier.pickVideo();
                      },
                      icon: Icon(
                        Iconsax.video_add5,
                        color: Theme.of(context).primaryColor,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'Select up to four images or a video from your gallery to get started.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
