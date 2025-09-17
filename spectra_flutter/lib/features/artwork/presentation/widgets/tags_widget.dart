import 'package:flutter/material.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget({
    super.key,
    required this.artwork,
  });

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Text(
          '${artwork.tagNames!.length} ${artwork.tagNames!.length == 1 ? 'Tag' : 'Tags'}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              mainAxisExtent: 35,
            ),
            itemCount: artwork.tagNames!.length,
            itemBuilder: (context, index) {
              final name = (artwork.tags![index]).tag!.name;
              final usageCount = (artwork.tags![index]).tag!.usageCount;
              return ItemChip(
                itemName: name,
                usageCount: usageCount.toString(),
                onTap: () {},
              );
            }),
      ],
    );
  }
}
