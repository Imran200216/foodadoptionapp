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

String decodeFluttermojifromString(String encodedData) {
  // Decode your JSON string and convert it to an SVG format.
  // Example for decoding the Fluttermoji JSON data into SVG string
  Map<String, dynamic> data = jsonDecode(encodedData);

  // Convert the map to an SVG string based on your avatar rendering logic
  // This is a placeholder; adjust according to your needs
  return "<svg>...your SVG representation...</svg>";
}
