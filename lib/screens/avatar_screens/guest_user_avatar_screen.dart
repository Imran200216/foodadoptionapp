import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';

class GuestUserAvatarScreen extends StatelessWidget {
  const GuestUserAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
          bottom: 30,
        ),
        child: Column(
          children: [
            FluttermojiCustomizer(),
          ],
        ),
      ),
    );
  }
}
