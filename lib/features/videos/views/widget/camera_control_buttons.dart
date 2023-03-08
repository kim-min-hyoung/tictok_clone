import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/rawData/camera_icons.dart';

import '../../../../common/widget/camera_icon_button.dart';

class CameraControlButtons extends StatelessWidget {
  final CameraController controller;
  final FlashMode flashMode;
  final void Function() toggleSelfMode;
  final void Function(FlashMode flashMode) setFlashMode;

  const CameraControlButtons({
    super.key,
    required this.controller,
    required this.flashMode,
    required this.toggleSelfMode,
    required this.setFlashMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CameraIconButton(
          onPressed: toggleSelfMode,
          icon: Icons.cameraswitch,
        ),
        for (var flashIcon in flashIcons)
          CameraIconButton(
            isSelect: flashMode == flashIcon['flashMode'],
            onPressed: () => setFlashMode(flashIcon["flashMode"]),
            icon: flashIcon['icon'],
          )
      ],
    );
  }
}
