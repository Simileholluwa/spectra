import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class UploadScreen extends ConsumerWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(uploadProvider);
    final notifier = ref.read(uploadProvider.notifier);
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: .5,
                ),
              ),
            ),
            child: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Iconsax.arrow_left_2),
              ),
              title: Text(
                "Upload",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.message_question,
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: UploadBottomNavbar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TopCarousel(),
              if (state.isSuccess &&
                  state.filePath.isNotEmpty &&
                  !state.isSearching &&
                  !state.hasError &&
                  !state.topLevelError)
                CanUploadWidget(),
              if (!state.isSuccess &&
                  state.filePath.isEmpty &&
                  !state.isSearching &&
                  !state.hasError &&
                  !state.topLevelError)
                InitialStateWidget(),
              if (!state.isSuccess &&
                  state.filePath.isNotEmpty &&
                  state.isSearching &&
                  !state.hasError &&
                  !state.topLevelError)
                FileSelectedWidget(),
              if (!state.isSuccess &&
                  state.filePath.isNotEmpty &&
                  !state.isSearching &&
                  state.hasError &&
                  !state.topLevelError)
                CannotUploadWidget(),
              if (!state.isSuccess &&
                  state.filePath.isNotEmpty &&
                  !state.isSearching &&
                  !state.hasError &&
                  state.topLevelError)
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(
                      color: Colors.red,
                      width: .5,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 15,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            state.errorMessage,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      IconButton.filled(
                        onPressed: () {
                          notifier.retry();
                        },
                        icon: const Icon(
                          Icons.refresh,
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
