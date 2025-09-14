import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class CanUploadWidget extends ConsumerWidget {
  const CanUploadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(uploadProvider);
    final notifier = ref.watch(uploadProvider.notifier);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: state.filePath.length > 1 ? true : false,
            height: 110,
            viewportFraction: state.filePath.length > 1 ? .8 : 1,
          ),
          items: state.filePath.asMap().entries.map((entry) {
            final index = entry.key;
            return Container(
              margin: EdgeInsets.fromLTRB(
                state.filePath.length > 1 ? 5 : 15,
                0,
                state.filePath.length > 1 ? 5 : 15,
                15,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: .5,
                ),
              ),
              child: Center(
                child: FileAndOptionsWidget(
                  index: index,
                ),
              ),
            );
          }).toList(),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
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
            spacing: 15,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: UploadChips(
                  icon: Iconsax.tag5,
                  title: 'Related tags',
                  addText: 'Add tag',
                  onAddTapped: () {
                    addTags(context: context);
                  },
                  onDeleteTapped: (item) {
                    notifier.removeTag(item);
                  },
                  items: state.tags,
                ),
              ),
              const Divider(
                height: 0,
                thickness: .5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: UploadChips(
                  icon: Iconsax.paintbucket5,
                  title: 'AI Models or Platforms',
                  addText: 'Add model or platform',
                  onAddTapped: () {
                    addAiModels(context: context);
                  },
                  items: state.models,
                  onDeleteTapped: (item) {
                    notifier.removeModel(item);
                  },
                ),
              ),
              const Divider(
                height: 0,
                thickness: .5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'AI Prompt',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            addAIPrompt(context: context);
                          },
                          child: Icon(
                            Iconsax.edit5,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    if (state.promptMessage.isNotEmpty)
                      Text(
                        state.promptMessage,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).hintColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                thickness: .5,
              ),
              GestureDetector(
                onTap: notifier.toggleAllowDownload,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 20,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Allow download',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Users will be able to download your artwork if you allow it.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: Switch(
                          value: state.allowDownload,
                          onChanged: (value) {
                            notifier.toggleAllowDownload();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                height: 0,
                thickness: .5,
              ),
              GestureDetector(
                onTap: notifier.toggleShowPrompt,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 10,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Show prompt',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Your prompt will be shown to users when they view your artwork.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: state.showPrompt,
                      onChanged: (value) {
                        notifier.toggleShowPrompt();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
