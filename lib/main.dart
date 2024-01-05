import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_application/bloc/authBloc/cubit.dart';
import 'package:network_application/networks/local.dart';
import 'package:network_application/page/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MyApp());
  await CacheHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Network Application',
          theme: ThemeData(
            textTheme: GoogleFonts.secularOneTextTheme(),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
