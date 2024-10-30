import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodadoptionapp/constants/colors.dart';
import 'package:foodadoptionapp/firebase_options.dart';
import 'package:foodadoptionapp/providers/auth_providers/email_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/foreget_email_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/google_auth_provider.dart';
import 'package:foodadoptionapp/providers/auth_providers/guest_auth_provider.dart';
import 'package:foodadoptionapp/providers/screen_providers/bottom_nav_provider.dart';
import 'package:foodadoptionapp/providers/screen_providers/get_started_provider.dart';
import 'package:foodadoptionapp/providers/screen_providers/home_carousel_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_email_details_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_google_details_provider.dart';
import 'package:foodadoptionapp/providers/user_details_providers/user_guest_details_provider.dart';
import 'package:foodadoptionapp/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

          /// email authentication provider
          ChangeNotifierProvider(
            create: (context) => EmailAuthenticationProvider(),
          ),

          /// guest authentication provider
          ChangeNotifierProvider(
            create: (context) => GuestAuthenticationProvider(),
          ),

          /// google authentication provider
          ChangeNotifierProvider(
            create: (context) => GoogleAuthenticationProvider(),
          ),

          /// forget email authentication provider
          ChangeNotifierProvider(
            create: (context) => ForgetPasswordEmailAuthProvider(),
          ),

          /// home carousel slider provider
          ChangeNotifierProvider(
            create: (context) => HomeCarouselProvider(),
          ),

          /// user email details provider
          ChangeNotifierProvider(
            create: (context) => UserEmailDetailsProvider(),
          ),

          /// user guest details provider
          ChangeNotifierProvider(
            create: (context) => UserGuestDetailsProvider(),
          ),

          /// user google details provider
          ChangeNotifierProvider(
            create: (context) => UserGoogleDetailsProvider(),
          ),
        ],
        builder: (context, child) {
          return ToastificationWrapper(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
                useMaterial3: true,
              ),
              home: const SplashScreen(),
            ),
          );
        });
  }
}
