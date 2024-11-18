import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/common_app_button.dart';

class NewRegistrationScreen extends StatelessWidget {
  const NewRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
              CommonAppButton(
                  buttonName: 'Next',
                  buttonIcon: Icons.arrow_right,
                  buttonAction: () {},
                ),
          ],
        ),
      ),
    );
  }
}