import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/circular_image.dart';
import 'package:zomato_clone/features/loginandsignup/controller/login_signup_controller.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isUserSignedIn = ref.read(loginSignUpControllerProvider).isUserSigned;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: black.withOpacity(0.12), blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  if (isUserSignedIn)
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: CircularImage(
                        imageLink:
                            "https://cdn.pixabay.com/photo/2018/02/08/22/27/flower-3140492_1280.jpg",
                        radius: 35,
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isUserSignedIn ? "Sekh" : "Your profile",
                          style: textTheme.titleSmall
                              ?.copyWith(fontSize: 26, height: 1),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                        Padding(
                          padding: isUserSignedIn
                              ? EdgeInsets.zero
                              : const EdgeInsets.only(top: 4.0, bottom: 10),
                          child: Text(
                            isUserSignedIn
                                ? "sekhgmainuddin@gmail.com"
                                : "Log in or sign up to view your complete pro...",
                            style: textTheme.bodyLarge?.copyWith(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isUserSignedIn)
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  "View activity",
                                  style: textTheme.bodyLarge?.copyWith(
                                      fontSize: 13, color: primaryColor),
                                ),
                                const Icon(
                                  Icons.arrow_right,
                                  size: 16,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                        if(!isUserSignedIn)
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: primaryColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "Continue",
                              style: textTheme.labelSmall?.copyWith(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isUserSignedIn)
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: darkBlack,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: jackoBean,
                    radius: 20,
                    child: ClipOval(
                      child: ShaderMask(
                        shaderCallback: (bounds) {
                          return goldMemberSizeGradient.createShader(bounds);
                        },
                        blendMode: BlendMode.color,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: Image.asset(
                              "assets/images/crown_icon.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Join Zomato Gold",
                      style:
                          textTheme.labelMedium?.copyWith(color: deepChampagne),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: deepChampagne,
                    size: 22,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

}
