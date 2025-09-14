import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeContentMasonryView extends StatelessWidget {
  const HomeContentMasonryView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return MasonryGridView.count(
      crossAxisCount: width > 500 && width < 1000 ? 2 : 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 20,
      padding: const EdgeInsets.fromLTRB(19, 10, 19, 19),
      itemCount: 10,
      itemBuilder: (context, index) {
        return SizedBox();
      },
    );
  }
}
