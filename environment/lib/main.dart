import 'package:flutter/material.dart';

class EnvironmentConfig {
  // Will not work without `const`
  static String APP_NAME = String.fromEnvironment('DEFINEEXAMPLE_APP_NAME',
      defaultValue: 'awesomeApp');

  static const String APP_SUFFIX =
      String.fromEnvironment('DEFINEEXAMPLE_APP_SUFFIX');
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Data from the environment is not loaded.
          Center(
            child: Text(EnvironmentConfig.APP_NAME),
          ),
          // The data from the environment should be loaded.
          const Center(
            child: Text(EnvironmentConfig.APP_SUFFIX),
          ),

          // The data from the environment should be loaded.
          const Center(
            child: Text(
              String.fromEnvironment('DEFINEEXAMPLE_APP_NAME',
                  defaultValue: 'awesomeApp'),
            ),
          ),
        ],
      ),
    );
  }
}
