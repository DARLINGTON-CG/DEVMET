import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_editor/image_editor.dart' hide ImageSource;

class EditPicturePage extends StatefulWidget {
  final File picture;
  const EditPicturePage({required this.picture});
  @override
  _EditPicturePageState createState() => _EditPicturePageState();
}

class _EditPicturePageState extends State<EditPicturePage> {
  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();
  final defaultColorMatrix = const <double>[
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
    0,
    0,
    0,
    0,
    1,
    0
  ];
  List<double> calculateSaturationMatrix(double saturation) {
    final m = List<double>.from(defaultColorMatrix);
    final invSat = 1 - saturation;
    final R = 0.213 * invSat;
    final G = 0.715 * invSat;
    final B = 0.072 * invSat;

    m[0] = R + saturation;
    m[1] = G;
    m[2] = B;
    m[5] = R;
    m[6] = G + saturation;
    m[7] = B;
    m[10] = R;
    m[11] = G;
    m[12] = B + saturation;

    return m;
  }

  double sat = 1;
  double bright = 0;
  double con = 1;
  double cropRatio = 1;

  List<double> calculateContrastMatrix(double contrast) {
    final m = List<double>.from(defaultColorMatrix);
    m[0] = contrast;
    m[6] = contrast;
    m[12] = contrast;
    return m;
  }

  File? image;
  @override
  void initState() {
    super.initState();
    image = widget.picture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildImage(),
      ),
      bottomSheet: BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: SafeArea(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('CANCEL',
                        style:
                            GoogleFonts.lato(color: Colors.red, fontSize: 13)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.flip,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.rotate_left,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.rotate_right,
                        color: Colors.white,
                      )),
                  TextButton(
                    onPressed: () async {
                      await crop();
                    },
                    child: Text('DONE',
                        style:
                            GoogleFonts.lato(color: Colors.blue, fontSize: 13)),
                  ),
                ],
              )),
            );
          }),
    );
  }

  Widget buildImage() {
    return ExtendedImage(
      image: ExtendedFileImageProvider(image!, cacheRawData: true),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      extendedImageEditorKey: editorKey,
      mode: ExtendedImageMode.editor,
      fit: BoxFit.contain,
      initEditorConfigHandler: (ExtendedImageState? state) {
        return EditorConfig(
          maxScale: 8.0,
          cropAspectRatio: cropRatio,
        );
      },
    );
  }

  Widget _buildFunctions() {
    return NavigationBar(
      onDestinationSelected: (int selected) {
        switch (selected) {
          case 0:
            flip();
            break;
          case 1:
            rotate(false);
            break;
          case 2:
            rotate(true);
            break;
          case 3:

            /// await crop();
            break;
        }
      },
      destinations: <Widget>[
        TextButton(
          child: Text('CANCEL',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 13)),
          onPressed: () {
            print("FDSOIFD");
          },
        ),
        Icon(
          Icons.flip,
          color: Colors.white,
        ),
        Icon(
          Icons.rotate_left,
          color: Colors.white,
        ),
        Icon(
          Icons.rotate_right,
          color: Colors.white,
        ),
        TextButton(
          onPressed: () async {
            await crop();
          },
          child: Text('DONE',
              style: GoogleFonts.lato(color: Colors.white, fontSize: 13)),
        ),
      ],
    );
  }

  Future<void> crop([bool test = false]) async {
    final ExtendedImageEditorState state = editorKey.currentState!;
    final Rect rect = state.getCropRect()!;
    final EditActionDetails? action = state.editAction;
    final double radian = action!.rotateAngle;

    final bool flipHorizontal = action.flipY;
    final bool flipVertical = action.flipX;
    final Uint8List img = state.rawImageData;

    final ImageEditorOption option = ImageEditorOption();

    option.addOption(ClipOption.fromRect(rect));
    option.addOption(
        FlipOption(horizontal: flipHorizontal, vertical: flipVertical));
    if (action.hasRotateAngle) {
      option.addOption(RotateOption(radian.toInt()));
    }

    option.addOption(ColorOption.saturation(sat));
    option.addOption(ColorOption.brightness(bright + 1));
    option.addOption(ColorOption.contrast(con));

    option.outputFormat = const OutputFormat.jpeg(100);

    final DateTime start = DateTime.now();
    final Uint8List? result = await ImageEditor.editImage(
      image: img,
      imageEditorOption: option,
    );

    // final Duration diff = DateTime.now().difference(start);
    // image!.writeAsBytesSync(result.);

    // Future.delayed(const Duration()).then((value) =>
    //     Navigator.pushReplacementNamed(context, uploadWallRoute,
    //         arguments: [image, false]));
  }

  void flip() {
    editorKey.currentState!.flip();
  }

  void rotate(bool right) {
    editorKey.currentState!.rotate(right: right);
  }
}
