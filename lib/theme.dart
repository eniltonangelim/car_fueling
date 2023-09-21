import 'package:flutter/material.dart';


const Color primaryColor = Color(0xFFD78D68);
const Color primaryColorDark = Color(0xFFEAC075);
const Color primaryColorLight = Color(0xFFFEFEFE);

const List<Color> primaryPallet = [
  primaryColor,
  primaryColorDark,
  secondaryColorLight
];

const Color secondaryColor = Color(0xFF070A1F);
const Color secondaryColorDark = Color(0xFF3C67A2);
const Color secondaryColorLight = Color(0xFFFEFFFE);
const List<Color> secondaryPallet = [
  secondaryColor,
  secondaryColorDark,
  primaryColorLight
];

ThemeData themeData = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
    iconTheme: const IconThemeData(color: secondaryColor),
    scaffoldBackgroundColor: primaryColor,
    textTheme: const TextTheme(
      displayMedium: TextStyle(color: secondaryColor),
      displaySmall: TextStyle(color: secondaryColor),
      displayLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: secondaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
        iconColor: secondaryColor,
        fillColor: primaryColorDark,
        hintStyle: const TextStyle(color: primaryColorLight),
        prefixIconColor:
        MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return secondaryColorDark;
          }
          if (states.contains(MaterialState.error)) {
            return secondaryColorDark;
          }
          return primaryColorLight;
        }),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 3, color: primaryColorLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 3, color: secondaryColorLight),
        ),
        alignLabelWithHint: true),
    buttonTheme: ButtonThemeData(
        colorScheme: const ColorScheme.light(primary: primaryColor),
        buttonColor: secondaryColor,
        splashColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.hovered)) {
              return primaryColor;
            }
            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return primaryColor;
            }
            return null;
          }),
        )));
