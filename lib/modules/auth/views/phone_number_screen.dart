import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/modules/auth/bloc/auth_bloc.dart';
import 'package:shopping_app/widgets/common_app_button.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          context
              .read<AuthBloc>()
              .add(const PhoneNumberSubmitted("+919976807012"));
        }),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 50),
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/auth/phone_number_image.svg',
                    height: 300,
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
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CommonAppButton(
                buttonName: 'Next',
              ),

              const SizedBox(height: 20), // Spacing from the bottom
            ],
          ),
        ),
      );
    });
  }
}
