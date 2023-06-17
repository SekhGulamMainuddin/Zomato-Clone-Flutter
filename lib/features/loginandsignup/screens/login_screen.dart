import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zomato_clone/common/utils/colors.dart';
import 'package:zomato_clone/common/widgets/CustomButton.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login-screen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.4,
            child: Image.asset(
              "assets/images/login_image_1.jpg",
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Text(
              "India's #1 Food Delivery and Dining App",
              style: GoogleFonts.ebGaramond(
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: lightGrey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Log in or sign up",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: grey),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: lightGrey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: midGrey, width: 1.0)),
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0)
                            .copyWith(left: 10),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              "assets/images/indian_flag_icon.png",
                              height: 30,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 25,
                              color: midGrey,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 4.0)
                        .copyWith(left: 10),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: midGrey, width: 1.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "+91",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextFormField(
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              controller: phoneEditingController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  isCollapsed: true,
                                  contentPadding: EdgeInsets.zero),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomButton(text: "Continue", onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: lightGrey,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "or",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: grey),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: lightGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
