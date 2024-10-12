import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/constants.dart';
import 'package:shopping_app/providers/auth_provider/auth_data_source.dart';
import 'package:shopping_app/widgets/common_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmpasswordFocusNode = FocusNode();
  final FocusNode numberFocusNode = FocusNode();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(     
          shrinkWrap: true,
          padding: const EdgeInsets.all(20), 
          children: [
            CommonWidgets.commmonTextFormfield(
              textController: nameController,
              textFocusNode: nameFocusNode,
              hintName: 'Name',
              textInputType: TextInputType.name),
            CommonWidgets.commmonTextFormfield(
              textController: emailController,
              textFocusNode: emailFocusNode,
              hintName: 'Email',
              textInputType: TextInputType.emailAddress),
            CommonWidgets.commmonTextFormfield(
              textController: phoneNumberController,
              textFocusNode: numberFocusNode,
              hintName: 'Mobile Number',
              textInputType: TextInputType.number),
            CommonWidgets.commmonTextFormfield(
              textController: passwordController,
              textFocusNode: passwordFocusNode,
              hintName: 'Password',
              textInputType: TextInputType.visiblePassword,
              obscureText: true),
            CommonWidgets.commmonTextFormfield(
              textController: confirmPasswordController,
              textFocusNode: confirmpasswordFocusNode,
              hintName: 'Confirm Password',
              textInputType: TextInputType.visiblePassword,
              obscureText: true),
            CommonWidgets.commonButton(
              buttonText: SIGN_UP,
              topPadding: 16,
              bottomPadding: 16,
              leftPadding: 0,
              rightPadding: 0,
              onTapFun: (){
              // AuthDataSource.userSignUp(email: nameController.text, password: passwordController.text, phoneNumber: phoneNumberController.text);
            }),
            const Divider(
              thickness: 1,
            ),
            CommonWidgets.commonButton(
              buttonText: 'Sign up with Google',
              topPadding: 16,
              leftPadding: 0,
              rightPadding: 0,
              onTapFun: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
