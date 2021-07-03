import 'package:flutter/material.dart';
import 'imageViwer.dart';

class popWidget {
  static Future<void> imageViewerDialog({
    @required BuildContext context,
    @required String path,
  }) {
    print(path);
    return showDialog(
      context: context,
      builder: (context) => ImageViewer(imagePath: path,),
    );
  }
}