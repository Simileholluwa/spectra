import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_flutter/core/core.dart';

class AppInfiniteList<T> extends StatelessWidget {
  const AppInfiniteList({
    super.key,
    required this.onRefresh,
    required this.pagingController,
    required this.itemBuilder,
    this.canUpload = true,
    this.errorMessage,
    this.showRefresh = true,
    this.shrinkWrap = false,
    this.noItemsFound,
    this.firstPageError,
    this.firstPageLoading,
    this.physics,
    this.scrollController,
  });

  final VoidCallback onRefresh;
  final PagingController<int, T> pagingController;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final bool canUpload;
  final String? errorMessage;
  final bool showRefresh;
  final bool shrinkWrap;
  final Widget? noItemsFound;
  final Widget? firstPageError;
  final Widget? firstPageLoading;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: PagingListener(
        controller: pagingController,
        builder: (context, state, fetchNextPage) =>
            PagedListView<int, T>.separated(
          state: state,
          fetchNextPage: fetchNextPage,
          shrinkWrap: shrinkWrap,
          physics: physics,
          scrollController: scrollController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: itemBuilder,
            newPageProgressIndicatorBuilder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.progressiveDots(
                      color: TColors.primary,
                      size: 50,
                    ),
                  ],
                ),
              );
            },
            noItemsFoundIndicatorBuilder: (context) {
              return noItemsFound ??
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                          'Nothing Here.',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 30,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "We've searched far and wide, but we couldn't find any results.",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        if (canUpload)
                          SizedBox(
                            height: 5,
                          ),
                        if (canUpload)
                          SizedBox(
                            height: 55,
                            child: FilledButton(
                              onPressed: () {
                                context.push('/artworks/upload');
                              },
                              child: Text(
                                'Upload your art',
                              ),
                            ).withLoading(
                              loading: false,
                            ),
                          ),
                      ],
                    ),
                  );
            },
            firstPageErrorIndicatorBuilder: (context) {
              return firstPageError ??
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 70),
                    child: LoadingError(
                      errorMessage: errorMessage,
                      showRefresh: showRefresh,
                      onRefresh: onRefresh,
                    ),
                  );
            },
            firstPageProgressIndicatorBuilder: (context) {
              return firstPageLoading ??
                  Center(
                    child: LoadingAnimationWidget.discreteCircle(
                      color: TColors.primary,
                      size: 70,
                    ),
                  );
            },
            noMoreItemsIndicatorBuilder: (context) {
              return const SizedBox();
            },
          ),
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
        ),
      ),
      onRefresh: () => Future.sync(
        () => onRefresh(),
      ),
    );
  }
}
