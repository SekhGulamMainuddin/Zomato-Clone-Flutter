import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:zomato_clone/common/utils/colors.dart';
import 'package:zomato_clone/common/utils/utils.dart';
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
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, color: black, fontWeight: FontWeight.w600),
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
        title: const Text(
          "OTP Verification",
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "We have sent a verification code to",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              widget.phoneNumber,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                onCompleted: (pin) {
                  showLoaderDialog(context);
                  ref
                      .read(loginSignUpControllerProvider)
                      .verifyOTP(widget.verificationId, pin)
                      .then((value) {
                        if(value){
                          showSnackBar(context, "Success");
                        }else{
                          showSnackBar(context, "Verification Failed Wrong OTP");
                        }
                        Navigator.pop(context);
                  });
                },
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
                    style:
                        TextStyle(color: snapshot.data == 0 ? primaryColor : midGrey),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Try other login methods",
              style:
                  TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
