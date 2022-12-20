import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/card_colors.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/places_list/widgets/card/card_description.dart';
import 'package:surf_study_project/features/places_list/widgets/favorite_button/favorite_button_widget.dart';

/// Class [CardPlace] is a card for places list feature
class CardPlace extends StatelessWidget {
  /// card index in the list, not the place index from api
  final int cardIndex;

  /// callback for onPressed action
  final ValueSetter<int> onPressedCard;

  /// [Place] displayed on current card
  final Place place;

  /// Constructor with [cardIndex], [place] and [onPressedCard]
  const CardPlace({
    required this.cardIndex,
    required this.place,
    required this.onPressedCard,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CardColors>();

    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Card(
        elevation: 0,
        color: theme?.cardBackgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Stack(
          children: [
            Column(children: [
              /// top card content
              CachedNetworkImage(
                height: 96.w,
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl: place.urls.first,
              ),

              /// bottom card content
              Expanded(
                child: CardDescription(
                  title: place.name,
                  description: place.description,
                ),
              ),
            ]),

            /// ripple effect
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () => onPressedCard(cardIndex),
                ),
              ),
            ),
            Positioned(
              left: 16.w,
              top: 16.w,
              right: 16.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    place.placeType.name,
                    style: AppTypography.smallBoldText
                        .copyWith(height: 1.w, color: theme?.tagColor),
                  ),
                  FavoriteButtonWidget(
                    place: place,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
