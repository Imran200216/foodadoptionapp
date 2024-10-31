import 'dart:convert';
import 'package:fluttermoji/fluttermoji_assets/fluttermojimodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> encodeMyJSON() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? fluttermojiOptions = pref.getString('fluttermojiSelectedOptions');

  if (fluttermojiOptions == null || fluttermojiOptions.isEmpty) {
    // Set default options if not already saved
    Map<String, int> fluttermojiOptionsMap =
        Map.from(defaultFluttermojiOptions);
    fluttermojiOptions = jsonEncode(fluttermojiOptionsMap);
    await pref.setString('fluttermojiSelectedOptions', fluttermojiOptions);
  }

  return fluttermojiOptions;
}
