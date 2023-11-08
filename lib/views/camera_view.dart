import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tflite_ai_object_detector/controller/scan_controller.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            print("LABEL IS ${controller.label}");
            return controller.isCameraInitialized.value
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            CameraPreview(controller.cameraController),
                            Positioned(
                              // top: (controller.y) * 500,
                              // right: (controller.x) * 800,
                              // top: 700,
                              // right: 500,
                              bottom: 0,
                              child: Container(
                                // width: controller.w * 100 * context.width / 100,
                                // height: controller.h * 100 * context.height / 100,

                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 4.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: Text(
                                        "Object: ${controller.label.toUpperCase()}",
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text("Made with ❤ by Henry"),
                        ),
                      ],
                    ),
                  )
                : const Stack(
                    children: [
                      Center(child: Text("Loading Preview...")),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Made with ❤ by Henry"),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
