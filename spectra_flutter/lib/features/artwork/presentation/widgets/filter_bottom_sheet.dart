import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

Future<dynamic> filterBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * .9,
    ),
    builder: (context) {
      return Consumer(builder: (context, ref, child) {
        final tabController = ref.watch(
          filterTabControllerProvider,
        );
        final artworkNotifier = ref.watch(
          artworkScreenNotifierProvider.notifier,
        );
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: SheetsBottomNav(
              onClearPressed: () {
                artworkNotifier.clearArtworkFilter();
                context.pop();
              },
              onApplyPressed: () {
                artworkNotifier.setArtworkFilter();
                context.pop();
              },
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Filters'),
            actions: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppTabBarDesign(
                tabController: tabController,
                showTopBorder: true,
                tabs: [
                  Tab(
                    text: 'TAGS',
                  ),
                  Tab(
                    text: 'MODELS/PLATFORMS',
                  ),
                  Tab(
                    text: 'MORE',
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              TagsFilter(),
              ModelsFilter(),
              MoreFilter(),
            ],
          ),
        );
      });
    },
  );
}
