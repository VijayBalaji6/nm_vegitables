import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/utils/constants/colors.dart';

/// for height
const SizedBox k5H = SizedBox(height: 5);
const SizedBox k10H = SizedBox(height: 10);
const SizedBox k15H = SizedBox(height: 15);
const SizedBox k20H = SizedBox(height: 20);
const SizedBox k25H = SizedBox(height: 25);
const SizedBox k30H = SizedBox(height: 30);
const SizedBox k40H = SizedBox(height: 40);
const SizedBox k50H = SizedBox(height: 50);

/// for wwidth
const SizedBox k5W = SizedBox(width: 5);
const SizedBox k10W = SizedBox(width: 10);
const SizedBox k15W = SizedBox(width: 15);
const SizedBox k20W = SizedBox(width: 20);

/// common text style
TextStyle common16Style = const TextStyle(
  color: Colors.white54,
  fontFamily: 'Roboto',
  fontSize: 16,
);

/// theme color text style
TextStyle theme18Style = const TextStyle(
    color: themeColor,
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600);

/// bold text style
TextStyle bold16Style = const TextStyle(
  color: Colors.grey,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w800,
  fontSize: 16,
);

/// font awesome icons
const emailIcon = FluentIcons.mail_16_regular;
const usernameIcon = FluentIcons.person_16_filled;
const passwordIcon = FluentIcons.lock_closed_16_regular;
const keyIcon = FluentIcons.key_24_regular;
const eyeOpenIcon = FluentIcons.eye_24_regular;
const eyeClosedIcon = FluentIcons.eye_off_24_regular;
const verifiedIcon = FluentIcons.eye_24_regular;
