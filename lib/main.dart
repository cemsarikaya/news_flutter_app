import 'package:flutter/material.dart';
import 'package:news_flutter_app/product/constant/light_theme.dart';
import 'package:news_flutter_app/view/news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Haberler', theme: LighTheme().theme, debugShowCheckedModeBanner: false, home: const NewsView());
  }
}
