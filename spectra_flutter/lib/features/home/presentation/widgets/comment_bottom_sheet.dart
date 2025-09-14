import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

Future<ArtworkComment?> commentBottomSheet(
  BuildContext context,
  int artworkId,
  bool isComment,
  int? parentId,
  String? ownerName,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) {
      return Consumer(builder: (context, ref, child) {
        final state = ref.watch(
          artworkCommentNotifierProvider,
        );
        final notifier = ref.watch(
          artworkCommentNotifierProvider.notifier,
        );
        return Container(
          padding: EdgeInsets.fromLTRB(
            15,
            15,
            15,
            MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isComment ? 'Add Comment' : 'Reply to @$ownerName',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 200,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: TextField(
                  maxLines: null,
                  minLines: 1,
                  controller: state.textController,
                  decoration: InputDecoration(
                    hintText:
                        'Write your ${isComment ? 'comment' : 'reply'}...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    notifier.setText(value);
                  },
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              if (state.errorMessage != null)
                Text(
                  state.errorMessage!,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.red,
                      ),
                ),
              FilledButton(
                onPressed: state.text.isEmpty || state.isLoading
                    ? null
                    : isComment
                        ? () async {
                            final result = await notifier.addComment(
                              ArtworkComment(
                                artworkId: artworkId,
                                ownerId: 0,
                                text: state.text.trim(),
                              ),
                            );
                            if (result == null) return;
                            state.textController.clear();
                            // ignore: use_build_context_synchronously
                            context.pop(result);
                          }
                        : () async {
                            final result = await notifier.addReply(
                              ArtworkComment(
                                artworkId: artworkId,
                                ownerId: 0,
                                text: state.text.trim(),
                                parentId: parentId,
                              ),
                            );
                            if (result == null) return;
                            state.textController.clear();
                            // ignore: use_build_context_synchronously
                            context.pop(result);
                          },
                child: Text('Send ${isComment ? 'Comment' : 'Reply'}'),
              ).withLoading(
                loading: state.isLoading,
              ),
            ],
          ),
        );
      });
    },
  );
}
