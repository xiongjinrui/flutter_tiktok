import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddVideoPage extends StatefulWidget {
  @override
  _AddVideoPageState createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  CameraController _cameraController;
  List<CameraDescription> cameras;

  @override
  void initState() {
    _initiallizedCamera();

    super.initState();
  }

  _initiallizedCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras.first, ResolutionPreset.medium)
      ..initialize().then((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return Scaffold(
          body: Stack(
            children: [
              (_cameraController != null &&
                      _cameraController.value.isInitialized)
                  ? Container(
                      child: CameraPreview(_cameraController),
                    )
                  : Container(),
              _topRowWidget(),
            ],
          ),
        );
      },
    );
  }

  Widget _topRowWidget() {
    return Container(
      child: Row(
        children: [
          Icon(Icons.close),
          Container(
            child: Row(
              children: [
                Icon(Icons.music_note),
                Text("Sounds"),
              ],
            ),
          ),
          Container(
              child: Column(
            children: [
              Icon(Icons.flip),
              Text(
                "flip",
                style: TextStyle(fontSize: 12),
              )
            ],
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();

    super.dispose();
  }
}
