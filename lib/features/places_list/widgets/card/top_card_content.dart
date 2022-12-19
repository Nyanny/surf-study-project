import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Class [TopCardContent] presents top half for a card with picture from [url] and [placeType]
class TopCardContent extends StatelessWidget {
  /// url to get a picture
  final String url;

  /// placeType to show
  final String placeType;

  /// Constructor with [url] and [placeType]
  const TopCardContent({
    required this.url,
    required this.placeType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: url,
        ),
        Row(
          children: [
            Text(placeType),
          ],
        ),
      ],
    );
  }
}
