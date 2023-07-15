
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant {
  static MaterialColor pmSwatch = const MaterialColor(0xff7286D3, <int, Color>{
    50: Color(0xff7286D3),
    100: Color(0xff7286D3),
    200: Color(0xff7286D3),
    300: Color(0xff7286D3),
    400: Color(0xff7286D3),
    500: Color(0xff7286D3),
    600: Color(0xff7286D3),
    700: Color(0xff7286D3),
    800: Color(0xff7286D3),
    900: Color(0xff7286D3),
  });

  static TextFormField commonTextField(
      {TextEditingController? controller,
      int? maxLength,
      String? hintText,
      TextInputType? keyboardType,
      Function(String)? onChanged,
      String? Function(String?)? validate}) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength ?? 30,
      validator: validate,
      onChanged: onChanged,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        contentPadding:  const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        hintText: hintText,
        counterText: '',
        labelText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  static TextFormField customDatePicker({
    TextEditingController? controller,
    String? hintText,
    Function()? onPress,
    String? Function(String?)? validate
}){
    return TextFormField(
      controller: controller,
      validator: validate,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed:onPress, icon: Icon(Icons.calendar_month_rounded,color: pmSwatch,),),
        contentPadding:  const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        enabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        errorBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedErrorBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  static TextStyle empCardTextStyle({
    double? size,
    FontWeight? weight
  }){
    return  GoogleFonts.vollkorn(fontSize: size,fontWeight: weight);
  }
}
