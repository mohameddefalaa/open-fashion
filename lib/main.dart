import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_fashion/core/themes/darkthemecolors.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';
import 'package:open_fashion/cubit/appcubit.dart';
import 'package:open_fashion/cubit/appstate.dart';
import 'package:open_fashion/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit(),
      child: BlocConsumer<Appcubit, Appstate>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Appcubit.isdark ? darktheme : lighttheme,

            home: const Home(),
          );
        },
      ),
    );
  }
}
