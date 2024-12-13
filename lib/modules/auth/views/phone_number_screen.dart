import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/models/auth/auth_models.dart';
import 'package:shopping_app/modules/auth/bloc/auth_bloc.dart';
import 'package:shopping_app/utils/config/constants/app_enum.dart';
import 'package:shopping_app/utils/config/routes/app_routes.dart';
import 'package:shopping_app/widgets/common_app_button.dart';
import 'package:shopping_app/widgets/common_text_from_field.dart';

class PhoneNumberScreen extends StatelessWidget {
  PhoneNumberScreen({super.key});

  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child:
                BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is PhoneNumberPageState) {
                switch (state.phoneNumberState.eventStatus) {
                  case EventStatus.success:
                    {
                      context.read<AuthBloc>().add(OtpPageInitEvent(
                          phoneNumber: phoneNumberController.text));
                      context.pushNamed(AppRoutes.otpScreen);
                    }
                    break;
                  case EventStatus.failed:
                    break;
                  default:
                    break;
                }
              }
            }, builder: (context, state) {
              if (state is PhoneNumberPageState) {
                final PhoneNumberState currentState = state.phoneNumberState;

                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        maxLength: 10,
                        textFormFieldController: phoneNumberController
                          ..text = currentState.phoneNumber,
                        keyboardType: TextInputType.phone,
                        labelName: 'Phone Number',
                        prefixIcon: Icons.phone,
                        emptyMessage: "Enter Phone Number",
                        onChangeEvent: (String phoneNumber) {
                          context.read<AuthBloc>().add(PhoneNumberPageInitEvent(
                              phoneNumber: phoneNumber));
                        },
                      ),
                      const SizedBox(height: 30),
                      CommonAppButton(
                        buttonName: 'Next',
                        buttonIcon: Icons.arrow_right,
                        buttonAction: currentState.phoneNumber.length == 10
                            ? () async {
                                context.read<AuthBloc>().add(
                                    PhoneNumberSubmitted(
                                        phoneNumberController.text));
                              }
                            : null,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            }),
          ),
        ),
      ),
    );
  }
}
