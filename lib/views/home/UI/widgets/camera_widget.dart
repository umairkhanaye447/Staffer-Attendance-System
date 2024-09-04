import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatelessWidget {
  const CameraWidget({
    super.key,
    required this.controller,
  });

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.40,
      child: ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: CameraPreview(controller),
        ),
      ),
    );
  }
}
