import 'package:flutter/material.dart';
import 'package:tflite_ai_object_detector/views/camera_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AI Object Detector',
      debugShowCheckedModeBanner: false,
      home: CameraView(),
    );
  }
}
