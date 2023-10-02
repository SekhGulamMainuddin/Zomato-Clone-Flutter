import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:zomato_clone/common/constants/colors.dart';
import 'package:zomato_clone/common/utils/utils.dart';
import 'package:zomato_clone/features/home/main_home/screens/main_home_screen.dart';
import 'package:zomato_clone/features/loginandsignup/controller/login_signup_controller.dart';

class VerifyOTPScreen extends ConsumerStatefulWidget {
  static const routeName = "/verify-otp-screen";
  final String verificationId;
  final int? resendToken;
  final String phoneNumber;

  const VerifyOTPScreen(this.verificationId, this.resendToken, this.phoneNumber,
      {Key? key})
      : super(key: key);

  @override
  ConsumerState<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends ConsumerState<VerifyOTPScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: textTheme.labelMedium?.copyWith(fontSize: 20),
      decoration: BoxDecoration(
        border: Border.all(color: midGrey),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: black),
      borderRadius: BorderRadius.circular(8),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP Verification",
          style: textTheme.labelSmall?.copyWith(fontSize: 18),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: black,
          ),
        ),
        backgroundColor: white,
        elevation: 0,
      ),
      backgroundColor: white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "We have sent a verification code to",
              style: textTheme.bodyLarge?.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.phoneNumber,
              style: textTheme.titleSmall,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Pinput(
                defaultPinTheme: defaultPinTheme,
                submittedPinTheme: submittedPinTheme,
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: verifyPin,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            StreamBuilder(
              stream: ref.read(loginSignUpControllerProvider).getResendTime(),
              builder: (context, snapshot) {
                final btnText = snapshot.data == null || snapshot.data == 0
                    ? "Resend SMS"
                    : "Resend SMS in ${snapshot.data}";
                return OutlinedButton(
                  onPressed: () {
                    setState(() {
                      showLoaderDialog(context);
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    side: BorderSide(
                      color: snapshot.data == 0 ? primaryColor : midGrey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  child: Text(
                    btnText,
                    style: textTheme.labelSmall?.copyWith(
                        color: snapshot.data == 0 ? primaryColor : midGrey,
                        fontSize: 16),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Try other login methods",
              style: textTheme.labelSmall?.copyWith(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  void verifyPin(String pin) {
    showLoaderDialog(context);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pop(context);
        showSnackBar(context, "Success");
        Navigator.pushNamed(context, MainHomeScreen.routeName);
      },
    );
    // ref
    //     .read(loginSignUpControllerProvider)
    //     .verifyOTP(widget.verificationId, pin)
    //     .then((value) {
    //   if (value) {
    //     showSnackBar(context, "Success");
    //   } else {
    //     showSnackBar(context, "Verification Failed Wrong OTP");
    //   }
    //   Navigator.pop(context);
    // });
  }
}
