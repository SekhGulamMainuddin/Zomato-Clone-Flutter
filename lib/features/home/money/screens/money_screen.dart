import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/features/home/money/widgets/gift_banner_widget.dart';
import 'package:zomato_clone/features/home/profile/screens/profile_screen.dart';
import 'package:zomato_clone/routes/navigation.dart';

class MoneyScreen extends ConsumerStatefulWidget {
  const MoneyScreen({super.key});

  @override
  ConsumerState createState() => _MoneyScreenState();
}

class _MoneyScreenState extends ConsumerState<MoneyScreen> {
  TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Container(
      color: ghostWhite,
      height: double.infinity,
      width: double.infinity,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240.0,
            floating: false,
            titleSpacing: 0,
            pinned: true,
            backgroundColor: maastrichtBlue,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final toolbarHeight = constraints.biggest.height;
                return FlexibleSpaceBar(
                  background: ColoredBox(
                    color: white,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://img.freepik.com/free-vector/5g-networking-technology-background-with-blue-digital-line_53876-119505.jpg",
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 70,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: white,
                                        size: 32,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: "Cuttack",
                                                        style: textTheme
                                                            ?.displaySmall
                                                            ?.copyWith(
                                                                color: white)),
                                                    const WidgetSpan(
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "India",
                                              style: textTheme?.labelSmall
                                                  ?.copyWith(
                                                color: white,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          ref.watch(homeNavigation.notifier).state = 1;
                                        },
                                        child: const CircleAvatar(
                                            radius: 19,
                                            backgroundColor: white,
                                            backgroundImage: CachedNetworkImageProvider(
                                                "https://cdn.pixabay.com/photo/2018/02/08/22/27/flower-3140492_1280.jpg")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  centerTitle: true,
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "MONEY",
                        style: textTheme?.titleSmall?.copyWith(
                            fontSize: 24,
                            color: white,
                            letterSpacing: 4,
                            height: 1),
                        textAlign: TextAlign.center,
                      ),
                      if (toolbarHeight > 80)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 1.5,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: fadedEdge1),
                              margin: const EdgeInsets.only(right: 10, top: 6),
                            ),
                            StyledText(
                              text: "<bold2>by</bold2> <bold3>zomato</bold3>",
                              tags: {
                                'bold2': StyledTextTag(
                                  style: textTheme?.labelSmall?.copyWith(
                                    fontSize: 12,
                                    color: white,
                                  ),
                                ),
                                'bold3': StyledTextTag(
                                  style: textTheme?.displayLarge?.copyWith(
                                      fontSize: 16,
                                      color: white,
                                      fontStyle: FontStyle.italic),
                                ),
                              },
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              height: 1.5,
                              width: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: fadedEdge2),
                              margin: const EdgeInsets.only(left: 10, top: 6),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 15.0),
                        child: Text(
                          "GIFT CARDS",
                          style: textTheme?.bodyLarge?.copyWith(
                            fontSize: 14,
                            color: grey,
                          ),
                        ),
                      ),
                      const GiftBannerWidget(),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        color: white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Column(
                            children: [
                              clickableLabel(
                                label: "Claim a Gift Card",
                                onClick: () {},
                              ),
                              clickableLabel(
                                label: "Gift Card Balance",
                                value: "Balance: €0.00",
                                onClick: () {},
                              ),
                              clickableLabel(
                                label: "Purchase History",
                                addBorder: false,
                                onClick: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 200,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clickableLabel({
    required String label,
    String? value,
    required VoidCallback onClick,
    bool addBorder = true,
  }) =>
      Material(
        child: InkWell(
          splashColor: primaryColor,
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              label,
                              style: textTheme?.labelMedium,
                            ),
                            if (value != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  value,
                                  style: textTheme?.bodyLarge?.copyWith(fontSize: 14, color: grey.withOpacity(0.8)),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: black,
                      size: 16,
                    ),
                  ],
                ),
                if (addBorder)
                  Row(
                    children: List.generate(
                      1100 ~/ 10,
                          (index) => Expanded(
                        child: Container(
                          color:
                          index % 2 == 0 ? Colors.transparent : midLightGrey,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
