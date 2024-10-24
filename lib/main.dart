import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/providers/bottom_nav_provider.dart';
import 'package:foodadoptionapp/providers/get_started_provider.dart';
import 'package:foodadoptionapp/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          /// get started provider
          ChangeNotifierProvider(
            create: (context) => GetStartedProvider(),
          ),

          /// bottom nav provider
          ChangeNotifierProvider(
            create: (context) => BottomNavProvider(),
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        });
  }
}
