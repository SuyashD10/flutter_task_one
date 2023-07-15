import 'package:flutter/material.dart';
import 'package:flutter_task_one/screens/home_screen/home_screen_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: AppConstant.pmSwatch,
          textTheme: GoogleFonts.poppinsTextTheme()
      ),
      home: HomeScreen(),
    );
  }
}
