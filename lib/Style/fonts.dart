import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/Style/Colors.dart';

class FontStyleConfig {

   String poppins = "Poppins";
   String logster = "Lobster"; // Fixed to "Logster" if that's the correct name
   String roboto = "Roboto"; // Fixed to "Roboto" if that's the correct name
   String montserrat = "Montserrat"; // Fixed to "Roboto" if that's the correct name
   String inter = "Inter"; // Fixed to "Roboto" if that's the correct name
   colors color=colors();
 TextStyle splashTitleStyle(){
   return TextStyle(
     fontSize: 44,
     fontFamily: logster,
     color: Colors.white,
     fontWeight: FontWeight.w400,
   );
 }
   TextStyle splashTextStyle(){
     return TextStyle(
       fontSize: 20,
       fontFamily: poppins,
       color: colors.splsahText ,
       fontWeight: FontWeight.w500,
     );
   }
   TextStyle nameTitle(){
     return TextStyle(
       fontSize: 30,
       fontFamily: montserrat,
       color: colors.headingColor ,
       fontWeight: FontWeight.w500,
     );
   }
   TextStyle nameDescription(){
     return TextStyle(
       fontSize: 20,
       fontFamily: inter,
       color: colors.normalTextColor ,
       fontWeight: FontWeight.w400,
     );
   }
   TextStyle popularTilte(){
     return TextStyle(
       fontSize: 20,
       fontFamily: poppins,
       color: colors.headingColor,
       fontWeight: FontWeight.w400,
     );
   }
   TextStyle viewAllText(){
     return TextStyle(
       fontSize: 20,
       fontFamily: roboto,
       color: colors.normalTextColor,
       fontWeight: FontWeight.w500,
     );
   }
   TextStyle normalTab(){
     return TextStyle(
       fontSize: 16,
       fontFamily: roboto,
       color: colors.normalTabText,
       fontWeight: FontWeight.w500,
     );
   }
}

