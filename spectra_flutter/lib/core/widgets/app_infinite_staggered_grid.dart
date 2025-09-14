import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_flutter/core/core.dart';

class AppInfiniteStaggeredGrid<T> extends StatelessWidget {
  const AppInfiniteStaggeredGrid({
    super.key,
    required this.onRefresh,
    required this.pagingController,
    required this.itemBuilder,
    this.canUpload = true,
    this.errorMessage,
    this.showRefresh = true,
    this.shrinkWrap = false,
    this.scrollController,
  });

  final VoidCallback onRefresh;
  final PagingController<int, T> pagingController;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final bool canUpload;
  final String? errorMessage;
  final bool showRefresh;
  final bool shrinkWrap;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: PagingListener(
        controller: pagingController,
        builder: (context, state, fetchNextPage) =>
            PagedMasonryGridView<int, T>.count(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          state: state,
          scrollController: scrollController,
          fetchNextPage: fetchNextPage,
          showNewPageErrorIndicatorAsGridChild: false,
          showNewPageProgressIndicatorAsGridChild: false,
          showNoMoreItemsIndicatorAsGridChild: false,
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
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text(
                      'Nothing Here.',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 30,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "We've searched far and wide, but we couldn't find any results.",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                            context.push('/home/upload');
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
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 82),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      'OOPS!',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 30,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      errorMessage ??
                          'Something went wrong while fetching the requested data. Please try again.',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (showRefresh)
                      SizedBox(
                        height: 1,
                      ),
                    if (showRefresh)
                      SizedBox(
                        width: 250,
                        child: FilledButton(
                          onPressed: onRefresh,
                          child: Text(
                            'Retry',
                          ),
                        ).withLoading(
                          loading: false,
                        ),
                      ),
                  ],
                ),
              );
            },
            firstPageProgressIndicatorBuilder: (context) {
              return Center(
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
        ),
      ),
      onRefresh: () => Future.sync(
        () => onRefresh(),
      ),
    );
  }
}
