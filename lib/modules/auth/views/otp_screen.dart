import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/widgets/common_app_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset('assets/images/auth/otp_image.svg'),
              const SizedBox(height: 20),
              const Text('Enter Verification Code',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('We have sent SMS to: 01XXXXXXXXXX'),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    return const SizedBox(
                      width: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Resend OTP')),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Change Phone Number')),
                ],
              ),
              const SizedBox(height: 20),
              CommonAppButton(
                buttonName: 'Next',
                buttonIcon: Icons.arrow_right,
                buttonAction: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
