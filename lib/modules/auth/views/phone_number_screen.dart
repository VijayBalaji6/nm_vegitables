import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/modules/auth/bloc/auth_bloc.dart';
import 'package:shopping_app/utils/routes/app_routes.dart';
import 'package:shopping_app/widgets/common_app_button.dart';
import 'package:shopping_app/widgets/common_text_from_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({super.key});

  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/auth/phone_number_image.svg',
                        height: 300,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Enter your mobile number',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'We need to verify you. We will send you a one time verification code.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CommonTextFormField(
                      textFormFieldController: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      labelName: 'Phone Number',
                      prefixIcon: Icons.phone,
                      emptyMessage: "Enter Phone Number",
                    ),
                  ],
                ),
                const Spacer(),
                CommonAppButton(
                  buttonName: 'Next',
                  buttonIcon: Icons.arrow_right,
                  buttonAction: () {
                    context
                        .read<AuthBloc>()
                        .add(PhoneNumberSubmitted(phoneNumberController.text));
                    context.pushNamed(AppRoutes.otpScreen);
                  },
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
        }),
      ),
    );
  }
}
