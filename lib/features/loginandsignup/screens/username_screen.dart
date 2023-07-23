import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/widgets/custom_button.dart';

class UserNameScreen extends ConsumerStatefulWidget {
  const UserNameScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends ConsumerState<UserNameScreen> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Zomato!",
          style: textTheme.labelSmall?.copyWith(fontSize: 18),
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
            height: 20,
          ),
          Text(
            "Tell us your name",
            style: textTheme.labelSmall?.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: nameController,
              style: textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Name",
                labelStyle: textTheme.labelSmall
                    ?.copyWith(color: midGrey, fontSize: 17),
                focusedBorder: const UnderlineInputBorder(
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
            child: CustomButton(
              text: "Continue",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
