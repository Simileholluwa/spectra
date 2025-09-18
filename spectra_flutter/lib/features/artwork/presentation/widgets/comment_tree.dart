import 'package:go_router/go_router.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CommentTreeWidget extends StatelessWidget {
  final ArtworkCommentWithUserState rootComment;
  final ContentBuilder<ArtworkCommentWithUserState>? contentRoot;
  final bool hasReplies;
  final int artworkId;
  final int commentId;
  final int index;
  final int repliesCount;

  const CommentTreeWidget(
    this.rootComment,
    this.hasReplies, {
    this.contentRoot,
    required this.artworkId,
    required this.commentId,
    required this.repliesCount,
    this.index = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final username = rootComment.comment.owner!.username!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RootCommentWidget(
          contentRoot!(
            context,
            rootComment,
          ),
          hasReplies,
          rootComment.comment.owner!.user!.imageUrl ?? '',
          index: index,
        ),
        if (hasReplies)
          CommentChildWidget(
            isLast: true,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (context.mounted) {
                      context.push(
                        '/$username/arts/$artworkId/comment/$commentId/replies',
                        extra: rootComment,
                      );
                    }
                  },
                  child: SizedBox(
                    height: 30,
                    child: Center(
                      child: Row(
                        spacing: 5,
                        children: [
                          Icon(
                            Iconsax.arrow_circle_right,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                          Text(
                            'Show $repliesCount ${repliesCount > 1 ? 'replies' : 'reply'}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

typedef ContentBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class RootCommentWidget extends StatelessWidget {
  final Widget content;
  final bool shouldDrawLine;
  final String rootCommentUserProfileUrl;
  final int index;

  const RootCommentWidget(
    this.content,
    this.shouldDrawLine,
    this.rootCommentUserProfileUrl, {
    super.key,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RootPainter(
        Theme.of(context).dividerColor,
        shouldDrawLine: shouldDrawLine,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Padding(
            padding: EdgeInsets.only(top: index == 0 ? 10 : 0),
            child: PreferredSize(
              preferredSize: const Size(46, 46),
              child: GestureDetector(
                onTap: () async {},
                child: AppUserProfileImage(
                  imageUrl: rootCommentUserProfileUrl,
                  radius: 23,
                ),
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: content,
            ),
          ),
        ],
      ),
    );
  }
}

class CommentChildWidget extends StatelessWidget {
  final Widget? content;
  final bool? isLast;

  const CommentChildWidget({
    required this.isLast,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.only(
      left: 54,
    );

    return CustomPaint(
      painter: _Painter(
        isLast: isLast!,
        padding: padding,
        pathColor: Theme.of(context).dividerColor,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: padding,
        child: Column(
          children: [
            content!,
          ],
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  bool isLast = false;
  EdgeInsets? padding;
  Color? pathColor;

  _Painter({
    required this.isLast,
    this.padding,
    this.pathColor,
  }) {
    _paint = Paint()
      ..color = pathColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.butt;
  }

  late Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();
    double rootDx = 23;
    path.moveTo(rootDx, 0);
    path.cubicTo(
      rootDx,
      0,
      rootDx,
      padding!.top + 20,
      rootDx * 2,
      padding!.top + 16,
    );
    canvas.drawPath(path, _paint);

    if (!isLast) {
      canvas.drawLine(
        Offset(rootDx, 0),
        Offset(rootDx, size.height),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RootPainter extends CustomPainter {
  late Paint _paint;
  Color? pathColor;
  final bool shouldDrawLine;
  RootPainter(
    this.pathColor, {
    required this.shouldDrawLine,
  }) {
    _paint = Paint()
      ..color = pathColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.butt;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double dx = 23;
    if (shouldDrawLine) {
      canvas.drawLine(
        Offset(dx, 46),
        Offset(dx, size.height),
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
