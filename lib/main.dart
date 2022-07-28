import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OneSpace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: Get.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/landing_background.png'),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('OneSpace', style: Get.textTheme.displayLarge),
                Text('En mantenimiento', style: Get.textTheme.displayMedium),
                SizedBox(height: 20.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        js.context.callMethod(
                            'open', ['https://facebook.com/onespace.social']);
                      },
                      icon: Icon(Icons.open_in_new),
                      label: Text('Facebook page'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        js.context.callMethod(
                            'open', ['https://instagram.com/onespace_social']);
                      },
                      icon: Icon(Icons.open_in_new),
                      label: Text('Instagram'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        js.context.callMethod(
                            'open', ['https://twitter.com/onespace_social']);
                      },
                      icon: Icon(Icons.open_in_new),
                      label: Text('Twitter'),
                    ),
                    ElevatedButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.newspaper),
                      label: Text('Blog'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
