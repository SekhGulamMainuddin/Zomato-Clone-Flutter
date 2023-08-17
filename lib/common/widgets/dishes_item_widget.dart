import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/utils/utils.dart';
import 'package:zomato_clone/common/widgets/star_rating.dart';

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
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SizedBox(
                    width: 98,
                    height: 35,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          backgroundColor: white,
                          padding: const EdgeInsets.all(4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(color: primaryColor)),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 14),
                            child: Text(
                              "ADD",
                              style: textTheme.labelLarge
                                  ?.copyWith(fontSize: 16, color: primaryColor),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.add,
                              color: primaryColor,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
              width: 20,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: greenColor, width: 1.5)),
              child: const Icon(
                Icons.circle,
                color: greenColor,
                size: 10,
              ),
            ),
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
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: yellowColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: yellowColor.withOpacity(0.3))),
                  child: const StarRating(
                    color: yellowColor,
                    rating: 2.75,
                    size: 16,
                  ),
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
