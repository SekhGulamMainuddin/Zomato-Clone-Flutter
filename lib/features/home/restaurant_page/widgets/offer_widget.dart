import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zomato_clone/common/constants/colors.dart';

class OfferWidget extends StatefulWidget {
  const OfferWidget({Key? key}) : super(key: key);

  @override
  State<OfferWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  var _currentPage = 0;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      _currentPage = (_currentPage + 1) % 5;
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ColoredBox(
            color: white,
            child: Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  color: lightBlueColor.withOpacity(0.2),
                  padding: const EdgeInsets.all(15),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn-icons-png.flaticon.com/128/726/726476.png",
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 65,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 5,
                      onPageChanged: (page){
                        setState(() {
                          _currentPage=page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Up to ₹150 cashback ${index + 1}",
                                  style: textTheme.labelMedium
                                      ?.copyWith(fontSize: 16),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "use code JUPITERFEAST | above ",
                                  style: textTheme.bodyLarge?.copyWith(
                                    fontSize: 15,
                                    color: grey.withOpacity(0.6),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${_currentPage + 1}/5",
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                          color: grey.withOpacity(0.6),
                        ),
                      ),
                      Row(
                        children: List.generate(
                          3,
                          (index) {
                            final isSelected = (_currentPage==0 && index==0) ||
                                (_currentPage <4 && _currentPage > 0 && index==1) || (_currentPage==4 && index==2);
                            return Container(
                              height: 5,
                              width: isSelected ? 8 : 5,
                              margin: const EdgeInsets.symmetric(horizontal: 1),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? primaryColor
                                    : grey.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(8)
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
