import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/utils/constants/colors.dart';

class CommonAppButton extends StatelessWidget {
  const CommonAppButton(
      {super.key,
      this.buttonAction,
      required this.buttonName,
      this.buttonIcon});
  final Function()? buttonAction;
  final String buttonName;
  final IconData? buttonIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          minimumSize: const Size(double.infinity, 50),
          elevation: 4,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: buttonAction,
        child: buttonIcon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  Text(
                    buttonName,
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward),
                ],
              )
            : Text(
                buttonName,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold),
              ));
  }
}
