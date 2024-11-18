import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/modules/auth/bloc/auth_bloc.dart';
import 'package:shopping_app/widgets/common_app_button.dart';
import 'package:shopping_app/widgets/common_text_from_field.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final FocusNode otpFieldFocus = FocusNode();
  final TextEditingController otpTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [     
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/auth/otp_image.svg',
                      height: 325,
                      width: 275,
                    )),
                const SizedBox(height: 50),
                const Text('Enter Verification Code',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                const Text('We have sent SMS to:',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                const SizedBox(height: 10),
                const Text('01XXXXXXXXXX',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                CommonTextFormField(
                  textFormFieldController: otpTextFieldController,
                  maxLength: 6,
                  emptyMessage: "Enter OTP",
                  focusNode: otpFieldFocus,
                  //onChangeEvent: (String x) => moveToNextField(index, x, context),
                ),               
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: const Text('Resend OTP')),
                    TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text('Change Phone Number')),
                  ],
                ),
                CommonAppButton(
                  buttonName: 'Next',
                  buttonIcon: Icons.arrow_right,
                  buttonAction: () {},
                ),
                const SizedBox(height: 50),
              ],
            );
          }),
        ),
      ),
    );
  }
}
