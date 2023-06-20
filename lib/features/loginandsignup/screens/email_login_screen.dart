import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zomato_clone/common/utils/colors.dart';
import 'package:zomato_clone/common/widgets/custom_button.dart';

class EmailLoginScreen extends ConsumerStatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends ConsumerState<EmailLoginScreen> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Continue with Email",
          style: TextStyle(color: black),
        ),
        centerTitle: false,
        leading: const Icon(
          Icons.arrow_back_sharp,
          color: black,
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      backgroundColor: white,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: nameController,
              style: GoogleFonts.poppins(
                  fontSize: 18, color: black, fontWeight: FontWeight.w500),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Email",
                labelStyle: TextStyle(
                    color: midGrey, fontWeight: FontWeight.w600, fontSize: 17),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: darkRed,
                    )),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(text: "Continue", onPressed: () {},),
          ),
        ],
      ),
    );
  }
}
