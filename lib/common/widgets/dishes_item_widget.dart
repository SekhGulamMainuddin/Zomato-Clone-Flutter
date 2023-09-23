import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/utils/utils.dart';
import 'package:zomato_clone/common/widgets/add_button.dart';
import 'package:zomato_clone/common/widgets/bordered_rating_widget.dart';
import 'package:zomato_clone/common/widgets/star_rating.dart';
import 'package:zomato_clone/common/widgets/veg_or_non_veg_icon_widget.dart';

class DishesItemWidget extends StatelessWidget {
  const DishesItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 180,
                      width: 200,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://madscookhouse.com/wp-content/uploads/2020/10/Paneer-Butter-Masala-Nut-Free.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: SizedBox(
                    width: 98,
                    height: 35,
                    child: AddButton(),
                  ),
                ),
              ],
            ),
            const VegOrNonVegIconWidget(),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 8),
              child: Text(
                "Mutton Biryani [4 Pieces, Hlaf]",
                style: textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                const BorderedRatingWidget(
                    color: yellowColor,
                    rating: 2.75,
                    size: 16,
                  ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    "335 ratings",
                    style: textTheme.bodyLarge?.copyWith(
                      fontSize: 13,
                      color: black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Text(
              "${getCurrencySymbol(context)}500",
              style: textTheme.titleMedium?.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
